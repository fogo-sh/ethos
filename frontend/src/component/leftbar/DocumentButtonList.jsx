import React, { useEffect } from "react";
import { useTenants } from "../../context/tenant";
import { useApiTenantDocuments } from "../../api/document";
import { shortnameToEmoji } from "../../utils";

function DocumentButtonList() {
	const { currentTenant } = useTenants();

	const { data: documents, refetch: refetchDocuments } =
		useApiTenantDocuments(currentTenant);

	useEffect(() => {
		console.log("useEffect");
		if (currentTenant) {
			refetchDocuments();
		}
	}, [refetchDocuments, currentTenant]);

	return (
		documents?.map((document) => (
			<button key={document.id} className="ethos-document-button">
				{shortnameToEmoji(document.icon)} {document.name}
			</button>
		)) || null
	);
}

export default DocumentButtonList;
