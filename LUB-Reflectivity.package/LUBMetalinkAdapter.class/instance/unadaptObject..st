adapting
unadaptObject: anObject
	metalinks ifNil: [ ^ self ].
	(metalinks at: anObject ifAbsent: [ ^ self ]) do: [ :link | link uninstall ].
	metalinks removeKey: anObject ifAbsent: [  ]