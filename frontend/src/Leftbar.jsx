import React, { useCallback, useEffect } from "react";
import { Route } from "react-router-dom";
import { useApiTenantDocuments } from "./api/document";
import { useApiTenants } from "./api/tenant";
import { useTenants } from "./context/tenant";
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
						className="ethos-tenant-select"
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
						{documents?.map((document) => (
							<button className="ethos-document-button">
								{shortnameToEmoji(document.icon)} {document.name}
							</button>
						))}
					</Route>
				</nav>
			)}
		</div>
	);
}

export default Leftbar;
