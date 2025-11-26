#!/usr/bin/env bash
set -euo pipefail

BASE_BRANCH="${BASE_BRANCH:-cloudflare-prod}"
HEAD_BRANCH="${HEAD_BRANCH:-release}"
TITLE="${TITLE:-Deploy static site}"
BODY="${BODY:-Automated deploy}"
TOKEN="${GH_PR_TOKEN:?Missing GH_PR_TOKEN}"
REPO="${GITHUB_REPOSITORY:?Missing GITHUB_REPOSITORY}"

# Check existing PR
EXISTING=$(curl -sS -H "Authorization: Bearer $TOKEN" \
  "https://api.github.com/repos/$REPO/pulls?head=$(echo "$REPO" | cut -d/ -f1):$HEAD_BRANCH&base=$BASE_BRANCH" | jq -r '.[0].number')
if [[ "$EXISTING" != "null" && -n "$EXISTING" ]]; then
  echo "PR exists: #$EXISTING"
  exit 0
fi

# Create PR
curl -sS -X POST -H "Authorization: Bearer $TOKEN" -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$REPO/pulls" \
  -d "$(jq -n --arg title "$TITLE" --arg head "$HEAD_BRANCH" --arg base "$BASE_BRANCH" --arg body "$BODY" '{title:$title, head:$head, base:$base, body:$body}')" \
  | jq -r '.html_url'