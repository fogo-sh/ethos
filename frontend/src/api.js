import { useCallback, useState } from "react";
import { useQuery } from "react-query";

const API_BASE_URL = "/api";
const API_TENANT_URL = `${API_BASE_URL}/tenant`;

const generateTenantDocumentsApiUrl = (tenantId) =>
	`${API_TENANT_URL}/${tenantId}/document/`;

const getTenants = async () => await (await fetch(API_TENANT_URL)).json();

export const useApiTenants = () => useQuery("tenants", () => getTenants());

const getTenantDocuments = async (tenantId) =>
	await (await fetch(generateTenantDocumentsApiUrl(tenantId))).json();

export const useApiTenantDocuments = (tenantId) =>
	useQuery(
		["tenant", "documents", tenantId],
		() => getTenantDocuments(tenantId),
		{ enabled: false }
	);
