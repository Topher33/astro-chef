import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
  output: 'static',
  integrations: [
    starlight({
      title: 'Family Recipes',
      description: 'A catalog of cherished family heirloom recipes',
      sidebar: [
        {
          label: 'Home',
          link: '/',
        },
        {
          label: 'Recipe Catalog',
          link: '/recipes/',
        },
        {
          label: 'Blog',
          link: '/blog/',
        },
      ],
      customCss: [
        './src/styles/custom.css',
      ],
    }),
  ],
});
