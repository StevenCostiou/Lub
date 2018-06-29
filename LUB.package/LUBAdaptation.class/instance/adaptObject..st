adapting
adaptObject: anObject
	anObject ifNil: [ ^ self ].
	anObject isAdapted
		ifTrue: [ ^ self ].
"	(objectAdapter hasAlreadyMigrated: anObject)
		ifNotNil: [ :class | ^ objectAdapter bruteMigrationFor: anObject to: class ]".
	objectAdapter hooks: (self generateHooksForObject: anObject).
	self generateStatesForObject: anObject.
	objectAdapter adaptObject: anObject