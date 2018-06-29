optimization
hasAlreadyMigrated: anObject
	^ adaptedObjects keys detect: [ :o | o class superclass == anObject class ] ifNone: [ nil ]