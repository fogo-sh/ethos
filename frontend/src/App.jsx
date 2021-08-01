import React from "react";

import { Providers } from "./context";
import Leftbar from "./Leftbar";
import Rightbar from "./Rightbar";

function App() {
	return (
		<Providers>
			<div className="ethos-main">
				<Leftbar />
				<Rightbar />
			</div>
		</Providers>
	);
}

export default App;
