import React from "react";
import { DocumentProvider } from "./document";
import { TenantProvider } from "./tenant";

export const Providers = ({ children }) => (
	<TenantProvider>
		<DocumentProvider>{children}</DocumentProvider>
	</TenantProvider>
);
