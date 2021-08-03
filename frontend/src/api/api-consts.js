export const API_BASE_URL = "/api";
export const API_TENANT_URL = `${API_BASE_URL}/tenant`;

export const generateTenantDocumentsApiUrl = (tenantId) =>
	`${API_TENANT_URL}/${tenantId}/document/`;
