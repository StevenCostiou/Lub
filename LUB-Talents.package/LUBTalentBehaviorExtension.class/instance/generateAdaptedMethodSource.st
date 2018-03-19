generation
generateAdaptedMethodSource
	| sourceStream methodSignature |
	sourceStream := WriteStream on: String new.
	methodSignature := originalAst selectorAndArgumentNames.
	self generateAdaptedMethodSourceHeaderOn: sourceStream methodSignature: methodSignature.
	self
		generateAdaptedMethodSourceExtendedBodyOn: sourceStream
		methodSignature: methodSignature.
	self generateAdaptedMethodSourceTailOn: sourceStream.
	^ sourceStream contents