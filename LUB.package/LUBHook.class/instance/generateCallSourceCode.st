accessing-convenience
generateCallSourceCode
	| ws ast |
	ws := WriteStream on: String new.
	ws nextPutAll: 'self '.
	args
		ifEmpty: [ ws nextPutAll: replacementMethod ast selectorAndArgumentNames.
			ws nextPut: $..
			^ ws contents ].
	ast := replacementMethod ast.
	1 to: args size do: [ :i | 
		| keyword arg |
		keyword := ast keywords at: i.
		arg := args at: i.
		ws nextPutAll: keyword.
		ws space.
		arg isSymbol
			ifTrue: [ ws nextPut: $# ].
		ws
			nextPutAll:
				((arg isKindOf: RBArgumentNode)
					ifTrue: [ arg name asString ]
					ifFalse: [ arg ]).
		ws space ].
	ws nextPut: $..
	^ ws contents