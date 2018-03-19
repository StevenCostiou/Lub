cleanup
uninstallAll
	| instances |
	instances := self allInstances.
	instances do: [ :i | i uninstall ]