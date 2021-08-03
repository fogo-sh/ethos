import React from "react";
import { Route } from "react-router-dom";
import DocumentButtonList from "./DocumentButtonList";
import TenantSelect from "./TenantSelect";

function LeftBar() {
	return (
		<div className="ethos-leftbar">
			<header>ethos</header>
			<nav>
				<TenantSelect />
				<hr />
				<Route path="/tenant/:tenant_id">
					<DocumentButtonList />
				</Route>
			</nav>
		</div>
	);
}

export default LeftBar;
