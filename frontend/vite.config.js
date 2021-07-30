import { defineConfig } from 'vite';
import reactRefresh from '@vitejs/plugin-react-refresh';

export default defineConfig({
  plugins: [reactRefresh()],
  server: {
    port: 4000,
    proxy: {
      '/api': {
        target: 'http://localhost:3000',
        rewrite: {
          '^/api': '/api',
        },
      },
    },
  },
});
