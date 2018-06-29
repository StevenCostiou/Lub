adapting
unadaptObject: anObject
	| anonClass objectsSharingAnonClass |
	metalinks ifNil: [ ^ self ].
	anonClass := anObject class.
	objectsSharingAnonClass := adaptedObjects at: anonClass ifAbsent: [ #() ].
	objectsSharingAnonClass remove: anObject ifAbsent: [  ].
	objectsSharingAnonClass
		ifEmpty: [ (metalinks at: anonClass ifAbsent: [ #() ]) do: [ :link | link uninstall ] ].
	metalinks removeKey: anonClass ifAbsent: [  ].
	anObject isAdapted
		ifTrue: [ self bruteMigrationFor: anObject to: anonClass superclass ]