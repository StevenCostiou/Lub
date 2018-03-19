migration
migrate: anObject to: aClass
	anObject becomeForward: (aClass new copyFrom: anObject).
	self initalizeAdaptedObject: anObject