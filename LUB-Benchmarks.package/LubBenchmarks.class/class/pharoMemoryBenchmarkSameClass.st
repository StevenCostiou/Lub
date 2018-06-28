benchmarks - memory
pharoMemoryBenchmarkSameClass
	| instances results block |
	instances := OrderedCollection new.
	results := Dictionary new.
	block := [ instances add: (Smalltalk at: #C1). ].
	Smalltalk garbageCollect.
	10 timesRepeat: block.
	results at: 1 put: (SpaceTally new spaceTally: (Array with: (Smalltalk at: #C1))).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	100 timesRepeat: block.
	results at: 100 put: (SpaceTally new spaceTally: (Array with: (Smalltalk at: #C1))).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	1000 timesRepeat: block.
	results at: 1000 put: (SpaceTally new spaceTally: (Array with: (Smalltalk at: #C1))).
	self saveResults: results named: 'pharo-mem-same-class' ..
	^ results