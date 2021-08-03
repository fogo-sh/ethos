import React, { createContext, useCallback, useContext, useState } from "react";
import { useHistory, useParams, useRouteMatch } from "react-router-dom";

const TenantContext = createContext();

function TenantProvider({ children }) {
	const match = useRouteMatch("/tenant/:tenantId");
	const [currentTenant, setCurrentTenantInner] = useState(
		match?.params.tenantId
	);

	const history = useHistory();

	const setCurrentTenant = useCallback((newCurrentTenant) => {
		setCurrentTenantInner(newCurrentTenant);
		if (newCurrentTenant === null) {
			history.push("/");
		} else {
			history.push(`/tenant/${newCurrentTenant}`);
		}
	});

	return (
		<TenantContext.Provider
			value={{
				currentTenant,
				setCurrentTenant,
			}}
		>
			{children}
		</TenantContext.Provider>
	);
}

export const Providers = ({ children }) => (
	<TenantProvider>{children}</TenantProvider>
);

export const useTenants = () => useContext(TenantContext);
