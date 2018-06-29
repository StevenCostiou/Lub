optimization
bruteMigrationFor: anObject to: class
	class adoptInstance: anObject.
	adaptedObjects at: class ifAbsentPut: [ WeakOrderedCollection new ]