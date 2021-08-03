import { useQuery } from "react-query";
import { generateTenantDocumentsApiUrl } from "./api-consts";

const getTenantDocuments = async (tenantId) =>
	await (await fetch(generateTenantDocumentsApiUrl(tenantId))).json();

export const useApiTenantDocuments = (tenantId) =>
	useQuery(
		["tenant", "documents", tenantId],
		() => getTenantDocuments(tenantId),
		{ enabled: false, keepPreviousData: true }
	);
