import React, { createContext, useContext, useState } from "react";

const TenantContext = createContext();

function TenantProvider({ children }) {
	const [currentTenant, setCurrentTenant] = useState(TenantContext);

	return <TenantContext.Provider value={{
		currentTenant,
		setCurrentTenant,
	}}>
		{children}
	</TenantContext.Provider>
}

export const Providers = ({ children }) =>
	<TenantProvider>
		{children}
	</TenantProvider>;

export const useTenants = () => useContext(TenantContext);
