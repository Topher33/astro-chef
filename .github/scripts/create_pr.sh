#!/usr/bin/env bash
# ...existing code...
set -euo pipefail

BASE_BRANCH="${BASE_BRANCH:-cloudflare-prod}"
HEAD_BRANCH="${HEAD_BRANCH:-release}"
TITLE="${TITLE:-Deploy static site}"
BODY="${BODY:-Automated deploy}"
TOKEN="${GH_PR_TOKEN:?Missing GH_PR_TOKEN}"
REPO="${GITHUB_REPOSITORY:?Missing GITHUB_REPOSITORY}"

echo "Repo: $REPO"
echo "Head: $HEAD_BRANCH -> Base: $BASE_BRANCH"

# Verify branches exist remotely
git fetch origin "$HEAD_BRANCH" "$BASE_BRANCH" || true
git ls-remote --heads origin "$HEAD_BRANCH" "$BASE_BRANCH"

# Check existing PR (use full ref owner:branch)
OWNER="${REPO%/*}"
EXISTING=$(curl -sS -H "Authorization: Bearer $TOKEN" \
  "https://api.github.com/repos/$REPO/pulls?head=$OWNER:$HEAD_BRANCH&base=$BASE_BRANCH" \
  | jq -r '.[0].number')
echo "Existing PR: ${EXISTING:-none}"

if [[ "$EXISTING" != "null" && -n "$EXISTING" ]]; then
  echo "PR already exists: #$EXISTING"
  exit 0
fi

# Create PR
RESP=$(curl -sS -X POST -H "Authorization: Bearer $TOKEN" -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$REPO/pulls" \
  -d "$(jq -n --arg title "$TITLE" --arg head "$HEAD_BRANCH" --arg base "$BASE_BRANCH" --arg body "$BODY" '{title:$title, head:$head, base:$base, body:$body}')" )

echo "$RESP" | jq -r '.html_url // .message'
STATUS=$(echo "$RESP" | jq -r '.html_url')
if [[ -z "$STATUS" || "$STATUS" == "null" ]]; then
  echo "PR creation failed. Full response:"
  echo "$RESP"
  exit 1
fi