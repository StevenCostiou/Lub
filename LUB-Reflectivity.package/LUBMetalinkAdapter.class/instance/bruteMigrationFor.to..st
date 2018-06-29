optimization
bruteMigrationFor: anObject to: class
	| anon |
	anon := anObject class.
	class adoptInstance: anObject.
	class isAnonymous
		ifFalse: [ anon recompile: #adaptedm1.
			^ self ].
	(adaptedObjects at: class ifAbsentPut: [ WeakOrderedCollection new ]) add: anObject