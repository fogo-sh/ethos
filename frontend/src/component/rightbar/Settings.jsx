import React, { useState } from "react";
import { useApi } from "../../context/api";

function Settings() {
	const { baseApiUrl, setBaseApiUrl } = useApi();

	const [isSettingsOpen, setIsSettingsOpen] = useState(false);
	const [customApiUrl, setCustomApiUrl] = useState(baseApiUrl);

	return (
		<>
			<button
				className="ethos-settings-button"
				onClick={() => setIsSettingsOpen(!isSettingsOpen)}
			>
				⚙️
			</button>
			{isSettingsOpen && (
				<div className="ethos-settings">
					<input
						value={customApiUrl}
						onChange={(e) => setCustomApiUrl(e.target.value)}
					/>
					<button onClick={() => setBaseApiUrl(customApiUrl)}>
						Set Base API URL
					</button>
					<button onClick={() => setIsSettingsOpen(!isSettingsOpen)}>❌</button>
				</div>
			)}
		</>
	);
}

export default Settings;
