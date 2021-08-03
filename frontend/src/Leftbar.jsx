import React, { useCallback, useEffect } from "react";
import { Route } from "react-router-dom";
import { useApiTenants, useApiTenantDocuments } from "./api";
import { useTenants } from "./context";
import { shortnameToEmoji } from "./utils";

function Leftbar() {
	const { currentTenant, setCurrentTenant } = useTenants();

	const { data: tenants, isLoading: isTenantsLoading } = useApiTenants();
	const { data: documents, refetch: refetchDocuments } =
		useApiTenantDocuments(currentTenant);

	useEffect(() => {
		if (currentTenant) {
			refetchDocuments();
		}
	}, [refetchDocuments, currentTenant]);

	const handleTenantChange = useCallback((event) => {
		const newTenant = event.target.value;
		if (newTenant === "") {
			setCurrentTenant(null);
		} else {
			setCurrentTenant(event.target.value);
		}
	});

	return (
		<div className="ethos-leftbar">
			<header>ethos</header>
			{isTenantsLoading && <>...</>}
			{!isTenantsLoading && (
				<nav>
					<select
						value={currentTenant === null ? "" : currentTenant}
						onChange={handleTenantChange}
					>
						<option value="">select a tenant</option>
						{tenants?.map((tenant) => (
							<option key={tenant.id} value={tenant.id}>
								{shortnameToEmoji(tenant.icon)} {tenant.name}
							</option>
						))}
					</select>
					<hr />
					<Route path="/tenant/:tenant_id">
						<ul>
							{documents?.map((document) => (
								<li key={document.id}>
									{shortnameToEmoji(document.icon)} {document.name}
								</li>
							))}
						</ul>
					</Route>
				</nav>
			)}
		</div>
	);
}

export default Leftbar;
