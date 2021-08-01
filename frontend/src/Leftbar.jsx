import React, { useEffect } from "react";
import { useApiTenant, useApiDocument } from "./api";
import { shortnameToEmoji } from "./utils";

function Leftbar() {
	const { tenants, fetchTenants } = useApiTenant();
	// const { documents, fetchDocuments } = useApiDocument();

	useEffect(() => {
		fetchTenants();
	}, [fetchTenants]);

	console.log({ tenants });

	return (
		<div className="ethos-leftbar">
			<header>ethos</header>
			<nav>
				<select>
					{tenants?.map((tenant) => (
						<option key={tenant.id} value={tenant.id}>
							{shortnameToEmoji(tenant.icon)} {tenant.name}
						</option>
					))}
				</select>
				<hr />
				{/*
				<ul>
					{documents?.map((tenant) => (
						<li>{tenant.name}</li>
					))}
				</ul>
				*/}
			</nav>
		</div>
	);
}

export default Leftbar;
