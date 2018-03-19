methods
writeLog: log
	self stream nextPutAll: log.
	self stream nextPut: $.