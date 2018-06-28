adapting
unadaptObject: anObject
	| anonClass |
	anObject isAdapted
		ifFalse: [ ^ self ].
	anonClass := anObject class.
	anObject becomeForward: (anonClass superclass new copyFrom: anObject)