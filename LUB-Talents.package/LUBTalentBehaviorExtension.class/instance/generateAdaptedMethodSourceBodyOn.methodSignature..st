generation
generateAdaptedMethodSourceBodyOn: sourceStream methodSignature: methodSignature
	sourceStream
		nextPutAll: 'result := super ' , methodSignature;
		nextPutAll: '.'.
	sourceStream cr