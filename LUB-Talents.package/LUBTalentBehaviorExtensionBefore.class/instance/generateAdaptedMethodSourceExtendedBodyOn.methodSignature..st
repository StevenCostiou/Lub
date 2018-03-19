generation
generateAdaptedMethodSourceExtendedBodyOn: sourceStream methodSignature: methodSignature
	sourceStream
		nextPutAll: 'self before' , methodSignature;
		nextPutAll: '.'.
	sourceStream cr.
	self
		generateAdaptedMethodSourceBodyOn: sourceStream
		methodSignature: methodSignature.
	sourceStream cr