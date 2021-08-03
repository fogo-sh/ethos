import { useQuery } from "react-query";
import { useApi } from "../context/api";
import { urlToJson } from "../utils";

export const useApiTenants = () => {
	const { tenantUrl } = useApi();

	return useQuery([tenantUrl, "tenants"], () => urlToJson(tenantUrl));
};
