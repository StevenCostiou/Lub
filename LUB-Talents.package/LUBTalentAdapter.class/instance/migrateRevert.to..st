migration
migrateRevert: anObject to: aClass
	anObject becomeForward: (aClass new copyFrom: anObject)