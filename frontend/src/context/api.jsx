import React, {
	createContext,
	useCallback,
	useContext,
	useMemo,
	useState,
} from "react";

const ApiContext = createContext();

export function ApiProvider({ children }) {
	const [baseApiUrl, setBaseApiUrl] = useState("/api");
	const tenantUrl = useMemo(() => `${baseApiUrl}/tenant`, [baseApiUrl]);
	const generateTenantDocumentsApiUrl = useCallback(
		(tenantId) => `${tenantUrl}/${tenantId}/document`,
		[tenantUrl]
	);

	return (
		<ApiContext.Provider
			value={{
				baseApiUrl,
				setBaseApiUrl,
				tenantUrl,
				generateTenantDocumentsApiUrl,
			}}
		>
			{children}
		</ApiContext.Provider>
	);
}

export const useApi = () => useContext(ApiContext);
