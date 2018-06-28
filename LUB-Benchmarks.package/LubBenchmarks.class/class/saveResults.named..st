accessing
saveResults: results named: filename
	('/home/steven/lub-benchmarks/' , filename) asFileReference writeStream
		nextPutAll: (STON toString: results);
		close