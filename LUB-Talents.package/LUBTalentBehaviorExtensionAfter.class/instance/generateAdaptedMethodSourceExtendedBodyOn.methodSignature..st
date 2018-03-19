generation
generateAdaptedMethodSourceExtendedBodyOn: sourceStream methodSignature: methodSignature
	self generateAdaptedMethodSourceBodyOn: sourceStream methodSignature: methodSignature.
	sourceStream cr.
	sourceStream nextPutAll: 'self after'.
	sourceStream nextPutAll: methodSignature.
	sourceStream nextPutAll: '.'.
	sourceStream cr