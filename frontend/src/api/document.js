import { useQuery } from "react-query";
import { useApi } from "../context/api";
import { urlToJson } from "../utils";

export const useApiTenantDocuments = (tenantId) => {
	const { generateTenantDocumentsApiUrl } = useApi();

	return useQuery(
		[generateTenantDocumentsApiUrl, "tenant", "documents", tenantId],
		() => urlToJson(generateTenantDocumentsApiUrl(tenantId)),
		{ enabled: false, keepPreviousData: true }
	);
};
