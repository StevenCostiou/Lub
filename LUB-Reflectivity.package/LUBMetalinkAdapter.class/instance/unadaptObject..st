adapting
unadaptObject: anObject
	metalinks ifNil: [ ^ self ].
	anObject class isAnonymous ifTrue:[metalinks removeKey: anObject ifAbsent: [  ].
		^self bruteMigrationFor: anObject to: anObject class superclass].
	(metalinks at: anObject ifAbsent: [ ^ self ]) do: [ :link | link uninstall ].
	metalinks removeKey: anObject ifAbsent: [  ]