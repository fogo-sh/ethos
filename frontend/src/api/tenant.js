import { useQuery } from "react-query";
import { API_TENANT_URL } from "./api-consts";

const getTenants = async () => await (await fetch(API_TENANT_URL)).json();

export const useApiTenants = () => useQuery("tenants", () => getTenants());
