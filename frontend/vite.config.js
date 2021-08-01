import { defineConfig } from "vite";
import reactRefresh from "@vitejs/plugin-react-refresh";

export default defineConfig({
	plugins: [reactRefresh()],
	server: {
		proxy: {
			"/api": {
				target: "http://localhost:4000",
				rewrite: (path) => path.replace(/^\/api/, ""),
			},
		},
	},
});
