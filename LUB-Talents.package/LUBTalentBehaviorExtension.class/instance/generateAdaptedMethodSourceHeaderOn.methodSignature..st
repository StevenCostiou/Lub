generation
generateAdaptedMethodSourceHeaderOn: sourceStream methodSignature: methodSignature
	sourceStream nextPutAll: methodSignature.
	sourceStream cr.
	sourceStream nextPutAll: '|result|'.
	sourceStream cr