accessing
iconName
	control = #acquire
		ifTrue: [ ^ #changeAdd ].
	control = #before
		ifTrue: [ ^ #glamorousUp ].
	control = #after
		ifTrue: [ ^ #glamorousDown ].
	^ #book