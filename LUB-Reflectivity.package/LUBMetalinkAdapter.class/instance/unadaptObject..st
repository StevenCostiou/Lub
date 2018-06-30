adapting
unadaptObject: anObject
	| objectsOfSameKind |
	metalinks ifNil: [ ^ self ].
	anObject isAdapted
		ifFalse: [ ^ self ].
	self bruteMigrationFor: anObject to: anObject class superclass.
	objectsOfSameKind := adaptedObjects at: anObject class ifAbsentPut: [ WeakOrderedCollection new ].
	objectsOfSameKind remove: anObject ifAbsent: [  ].
	objectsOfSameKind isEmpty
		ifFalse: [ ^ self ].
"	metalinks do: [ :link | link uninstall ]"