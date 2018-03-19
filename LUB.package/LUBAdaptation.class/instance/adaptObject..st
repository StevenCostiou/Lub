adapting
adaptObject: anObject
	anObject ifNil: [ ^ self ].
	anObject isAdapted
		ifTrue: [ ^ self ].
	objectAdapter hooks: (self generateHooksForObject: anObject).
	self generateStatesForObject: anObject.
	objectAdapter adaptObject: anObject