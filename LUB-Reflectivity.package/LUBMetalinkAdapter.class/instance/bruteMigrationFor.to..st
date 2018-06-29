optimization
bruteMigrationFor: anObject to: class
	class adoptInstance: anObject.
	class isAnonymous
		ifFalse: [ ^ self ].
	(adaptedObjects at: class ifAbsentPut: [ WeakOrderedCollection new ]) add: anObject