adapting
unadaptObject: anObject
	anObject isAdapted
		ifFalse: [ ^ self ].
	objectAdapter unadaptObject: anObject