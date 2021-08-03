import React from "react";
import { TenantProvider } from "./tenant";

export const Providers = ({ children }) => (
	<TenantProvider>{children}</TenantProvider>
);
