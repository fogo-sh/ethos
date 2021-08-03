import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import { QueryClient, QueryClientProvider } from "react-query";

import { Providers } from "./context/providers";
import LeftBar from "./component/leftbar/LeftBar";
import RightBar from "./component/rightbar/RightBar";

const queryClient = new QueryClient();

function App() {
	return (
		<Router>
			<QueryClientProvider client={queryClient}>
				<Providers>
					<div className="ethos-main">
						<LeftBar />
						<RightBar />
					</div>
				</Providers>
			</QueryClientProvider>
		</Router>
	);
}

export default App;
