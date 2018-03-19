generation
generateHooksForObject: anObject
	| generatedHooks originalClass |
	originalClass := anObject class isAnonymous
		ifTrue: [ anObject class superclass ]
		ifFalse: [ anObject class ].
	generatedHooks := hooks
		collect: [ :spec | 
			| selector originalMethod replacementMethod hook |
			selector := spec key.
			originalMethod := originalClass lookupSelector: selector.
			replacementMethod := referenceClass lookupSelector: selector.
			hook := LUBHook hook: originalMethod with: replacementMethod control: spec value.
			hook args: (originalMethod ifNotNil: [ :cm | cm ast arguments ]).
			hook ].
	^ generatedHooks