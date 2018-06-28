benchmarks - states
benchmarkPharoInstVarLookup
	| o results times |
	o := AdaptedClass2 new.
	results := Dictionary new: 10000.
	
	times := OrderedCollection new: 10000.
	Smalltalk garbageCollectMost.
	1000
		timesRepeat: [ Smalltalk garbageCollect.
			times add: o m ].
	results at: 'm' put: (times collect: [ :d | d asMilliSeconds ]).
	
	times := OrderedCollection new: 10000.
	Smalltalk garbageCollectMost.
	1000
		timesRepeat: [ Smalltalk garbageCollect.
			times add: o m1 ].
	results at: 'm1' put: (times collect: [ :d | d asMilliSeconds ]).
	^ results