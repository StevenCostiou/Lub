accessing-convenience
buildAdaptedSourceCoce
	| ws |
	(self isControlAcquire or: [ self isControlInstead ])
		ifTrue: [ ^ replacementMethod sourceCode ].
	ws := WriteStream on: String new.
	ws nextPutAll: originalMethod ast selectorAndArgumentNames.
	ws crtab.
	self isControlAfter
		ifTrue: [ ws nextPutAll: '|returnValue|'.
			ws crtab ].
	self isControlBefore
		ifTrue: [ ws nextPutAll: self generateCallSourceCode.
			ws crtab ].
	ws nextPutAll: (self sourceBodyFrom: originalMethod ast body wrapReturns: self isControlAfter).
	^ ws contents