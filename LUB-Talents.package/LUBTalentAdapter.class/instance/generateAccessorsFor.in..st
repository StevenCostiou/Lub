anon class creation
generateAccessorsFor: stateName in: aClass
	aClass compile: stateName , ': anObject ' , stateName , ':= anObject'.
	aClass compile: stateName , ' ^' , stateName