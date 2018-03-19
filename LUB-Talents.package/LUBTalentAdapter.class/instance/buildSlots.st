migration
buildSlots
	| slots |
	slots := OrderedCollection new.
	states
		keysDo: [ :s | 
			| slot |
			slot := InstanceVariableSlot named: s asSymbol.
			slots add: slot ].
	^ slots asArray