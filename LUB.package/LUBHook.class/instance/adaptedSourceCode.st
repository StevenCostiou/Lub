accessing-convenience
adaptedSourceCode
	originalMethod ifNil: [ ^ replacementMethod sourceCode ].
	^ self buildAdaptedSourceCoce