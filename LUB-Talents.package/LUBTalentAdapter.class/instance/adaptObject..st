adapting
adaptObject: anObject
	| anonSubclass |
	anonSubclass := self findAnonymousSubclassOf: anObject class.
	anonSubclass
		ifNil: [ anonSubclass := self newAnonymousSubclassFor: anObject.
			hooks
				do: [ :hook | 
					| strategy |
					strategy := self hookInstallerStrategyFor: hook.
					strategy install: hook in: anonSubclass ].
			states keysDo: [ :k | self generateAccessorsFor: k in: anonSubclass ] ].
	self migrate: anObject to: anonSubclass.
	^ anObject