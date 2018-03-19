accessing
icon
	control = #acquire
		ifTrue: [ ^ ThemeIcons current iconNamed: #changeAdd ].
	control = #before
		ifTrue: [ ^ ThemeIcons current iconNamed: #glamorousUp ].
	control = #after
		ifTrue: [ ^ ThemeIcons current iconNamed: #glamorousDown ].
	^ ThemeIcons current iconNamed: #book