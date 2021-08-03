import React from "react";
import { ApiProvider } from "./api";
import { DocumentProvider } from "./document";
import { TenantProvider } from "./tenant";

export const Providers = ({ children }) => (
	<ApiProvider>
		<TenantProvider>
			<DocumentProvider>{children}</DocumentProvider>
		</TenantProvider>
	</ApiProvider>
);
