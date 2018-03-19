migration
initalizeAdaptedObject: anObject
	states
		keysAndValuesDo: [ :state :value | 
			| setter |
			setter := (state , ':') asSymbol.
			anObject perform: setter with: value ]