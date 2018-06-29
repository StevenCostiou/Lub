optimization
hasAlreadyMigrated: anObject
	^ adaptedObjects keys detect: [ :class | class superclass == anObject class ] ifNone: [ nil ]