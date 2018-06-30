actions
uninstall
	super uninstall.
	metalinks do:[:link|link uninstall].
	metalinks := nil