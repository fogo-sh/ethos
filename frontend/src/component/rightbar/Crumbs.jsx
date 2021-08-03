import React, { useEffect } from "react";
import { useTenants } from "../../context/tenant";
import { useApiTenants } from "../../api/tenant";
import { useApiTenantDocuments } from "../../api/document";
import { useDocuments } from "../../context/document";

function Crumbs() {
	const { currentTenant } = useTenants();
	const { data: tenants } = useApiTenants();

	const { currentDocument } = useDocuments();
	const { data: documents, refetch: refetchDocuments } =
		useApiTenantDocuments(currentTenant);

	useEffect(() => {
		if (currentTenant) {
			refetchDocuments();
		}
	}, [refetchDocuments, currentTenant]);

	const tenant = tenants?.find((t) => t.id === currentTenant)?.name ?? "...";
	const document =
		documents?.find((d) => d.id === currentDocument)?.name ?? "...";

	if (currentTenant === null || currentDocument === null) {
		return null;
	}

	return (
		<div className="ethos-crumbs">
			{tenant} / {document}
		</div>
	);
}

export default Crumbs;
