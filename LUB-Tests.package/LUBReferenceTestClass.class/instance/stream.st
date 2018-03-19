accessing
stream
	^ stream ifNil: [ self resetStream ]