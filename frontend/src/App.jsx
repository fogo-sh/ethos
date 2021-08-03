import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import { QueryClient, QueryClientProvider } from "react-query";

import { Providers } from "./context/providers";
import Leftbar from "./Leftbar";
import Rightbar from "./Rightbar";

const queryClient = new QueryClient();

function App() {
	return (
		<Router>
			<QueryClientProvider client={queryClient}>
				<Providers>
					<div className="ethos-main">
						<Leftbar />
						<Rightbar />
					</div>
				</Providers>
			</QueryClientProvider>
		</Router>
	);
}

export default App;
