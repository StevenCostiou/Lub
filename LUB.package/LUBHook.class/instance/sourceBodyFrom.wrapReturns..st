accessing-convenience
sourceBodyFrom: astBody wrapReturns: wrapReturns
	| source originalSource returnNodes index |
	wrapReturns
		ifFalse: [ ^ astBody formattedCode ].
	source := WriteStream on: String new.
	originalSource := astBody source.
	returnNodes := (astBody allChildren select: [ :c | c isReturn ]) asSortedCollection: [ :a :b | a start < b start ].
	index := astBody start.
	returnNodes
		do: [ :return | 
			| temp wrappedReturn |
			temp := RBTemporaryNode named: 'returnValue'.
			wrappedReturn := RBAssignmentNode variable: temp value: return value.
			source nextPutAll: (originalSource copyFrom: index to: return start - 1).
			source nextPutAll: wrappedReturn formattedCode.
			source nextPut: $..
			source crtab.
			source nextPutAll: self generateCallSourceCode.
			source crtab.
			source nextPutAll: '^returnValue'.
			index := return stop + 1 ].
	source contents isEmpty
		ifTrue: [ source nextPutAll: astBody formattedCode ].
	(source contents notEmpty and: [ source contents last = $. ])
		ifFalse: [ source nextPut: $. ].
	astBody statements last isReturn
		ifFalse: [ source crtab.
			source nextPutAll: self generateCallSourceCode ].
	^ source contents