# astro-chef

Astro docs recipes catalog for digitizing family heirloom recipes.

## Overview

This is a family recipes catalog built with [Astro](https://astro.build) and the [Starlight](https://starlight.astro.build) documentation theme. It features a searchable and filterable collection of cherished family recipes passed down through generations.

## Features

- **Interactive Recipe Catalog** - Browse all recipes with real-time search and category filtering
- **Recipe Schema** - Structured recipe data following a defined JSON schema
- **Family Stories Blog** - Share the stories and memories behind the recipes
- **Responsive Design** - Beautiful, mobile-friendly interface powered by Starlight
- **Search Functionality** - Find recipes by name, ingredients, or description
- **Category Filtering** - Filter recipes by type (Desserts, Main Dishes, Soups & Stews, Breads & Baking, etc.)

## Project Structure

```
/
├── public/              # Static assets
├── src/
│   ├── assets/
│   │   └── recipes.json     # Recipe data catalog
│   ├── components/
│   │   └── RecipeCatalog.astro  # Interactive recipe catalog component
│   ├── content/
│   │   ├── docs/
│   │   │   ├── index.md     # Home page
│   │   │   ├── recipes.mdx  # Recipe catalog page
│   │   │   └── blog.md      # Blog/stories page
│   │   └── config.ts        # Content collections configuration
│   ├── recipes/
│   │   └── schema.json      # JSON schema for recipe structure
│   └── styles/
│       └── custom.css       # Custom styling for recipe cards
├── astro.config.mjs     # Astro configuration
├── package.json
└── tsconfig.json
```

## Getting Started

### Prerequisites

- Node.js 18+ and npm

### Installation

1. Clone the repository:
```bash
git clone <your-repository-url>
cd astro-chef
```

2. Install dependencies:
```bash
npm install
```

### Development

Start the development server:
```bash
npm run dev
```

The site will be available at `http://localhost:4321/`

### Building

Build the site for production:
```bash
npm run build
```

Preview the production build:
```bash
npm run preview
```

## Recipe Schema

Recipes follow a structured JSON schema located at `/src/recipes/schema.json`. Each recipe includes:

- **id** - Unique identifier
- **title** - Recipe name
- **category** - Recipe category (Appetizers, Main Dishes, Side Dishes, Desserts, etc.)
- **description** - Brief description
- **prepTime** - Preparation time
- **cookTime** - Cooking time
- **servings** - Number of servings
- **ingredients** - List of ingredients
- **instructions** - Step-by-step cooking instructions
- **notes** - Additional tips or notes
- **origin** - History or origin of the recipe
- **tags** - Additional categorization tags

## Adding New Recipes

To add new recipes, edit `/src/assets/recipes.json` following the schema defined in `/src/recipes/schema.json`.

## Technologies Used

- **Astro** - Static site generator
- **Starlight** - Documentation theme
- **TypeScript** - Type-safe development
- **CSS** - Custom styling

## License

See LICENSE file for details.

