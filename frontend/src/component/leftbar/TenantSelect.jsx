import React, { useCallback } from "react";
import { useApiTenants } from "../../api/tenant";
import { useTenants } from "../../context/tenant";
import { shortnameToEmoji } from "../../utils";

function TenantSelect() {
	const { currentTenant, setCurrentTenant } = useTenants();
	const { data: tenants, isLoading: isTenantsLoading } = useApiTenants();

	const handleTenantChange = useCallback((event) => {
		const newTenant = event.target.value;
		if (newTenant === "") {
			setCurrentTenant(null);
		} else {
			setCurrentTenant(event.target.value);
		}
	});

	return (
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
	);
}

export default TenantSelect;
