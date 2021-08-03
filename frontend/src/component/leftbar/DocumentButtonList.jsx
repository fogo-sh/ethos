import React, { useEffect } from "react";
import { useTenants } from "../../context/tenant";
import { useDocuments } from "../../context/document";
import { useApiTenantDocuments } from "../../api/document";
import { shortnameToEmoji } from "../../utils";

function DocumentButtonList() {
	const { currentTenant } = useTenants();
	const { currentDocument, setCurrentDocument } = useDocuments();

	const { data: documents, refetch: refetchDocuments } =
		useApiTenantDocuments(currentTenant);

	useEffect(() => {
		if (currentTenant) {
			refetchDocuments();
		}
	}, [refetchDocuments, currentTenant]);

	return (
		documents?.map((document) => (
			<button
				key={document.id}
				className="ethos-document-button"
				disabled={currentDocument === document.id}
				onClick={() => setCurrentDocument(document.id)}
			>
				{shortnameToEmoji(document.icon)} {document.name}
			</button>
		)) || null
	);
}

export default DocumentButtonList;
