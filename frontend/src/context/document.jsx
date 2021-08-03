import React, {
	createContext,
	useCallback,
	useContext,
	useEffect,
	useState,
} from "react";
import { useHistory, useRouteMatch } from "react-router-dom";
import { useTenants } from "./tenant";

const DocumentContext = createContext();

export function DocumentProvider({ children }) {
	const { currentTenant } = useTenants();

	const match = useRouteMatch("/tenant/:tenantId/document/:documentId");
	const [currentDocument, setCurrentDocumentInner] = useState(
		match?.params.documentId ?? null
	);

	const history = useHistory();

	const setCurrentDocument = useCallback((newCurrentDocument) => {
		setCurrentDocumentInner(newCurrentDocument);
		if (newCurrentDocument === null) {
			history.push(`/tenant/${currentTenant}`);
		} else {
			history.push(`/tenant/${currentTenant}/document/${newCurrentDocument}`);
		}
	});

	useEffect(() => {
		setCurrentDocumentInner(null);
	}, [currentTenant, setCurrentDocumentInner]);

	return (
		<DocumentContext.Provider
			value={{
				currentDocument,
				setCurrentDocument,
			}}
		>
			{children}
		</DocumentContext.Provider>
	);
}

export const useDocuments = () => useContext(DocumentContext);
