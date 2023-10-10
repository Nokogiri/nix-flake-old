{
	services.uptime-kuma = {
		enable = false;
		settings = {
			HOST = "10.200.200.1";
			PORT = "4000";
		};
	};
	systemd.services.uptime-kuma.serviceConfig.Group = "root";
}
