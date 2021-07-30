import { useCallback, useState } from "react";

const API_BASE = "/api";
const API_TENANT = `${API_BASE}/tenant`;
const API_DOCUMENT = `${API_BASE}/document`;

export const useApiTenant = () => {
	const [tenants, setTenants] = useState(null);

	const fetchTenants = useCallback(() => {
		fetch(API_TENANT)
			.then(response => response.json())
			.then((newTenants) => setTenants(newTenants));
	}, [setTenants]);

	return { tenants, fetchTenants };
};

export const useApiDocument = () => {
	const [documents, setDocuments] = useState(null);

	const fetchDocuments = useCallback(() => {
		fetch(API_DOCUMENT)
			.then(response => response.json())
			.then((newDocuments) => setDocuments(newDocuments));
	}, [setDocuments]);

	return { documents, fetchDocuments };
};

