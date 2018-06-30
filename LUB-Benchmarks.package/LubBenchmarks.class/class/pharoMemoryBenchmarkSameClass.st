benchmarks - memory
pharoMemoryBenchmarkSameClass
	| instances results block |
	instances := OrderedCollection new.
	results := Dictionary new.
	block := [ instances add: (Smalltalk at: #C1) new ].
	Smalltalk garbageCollect.
	10 timesRepeat: block.
	results at: 10 put: (self lubSpaceTallyFor: (Array with: (Smalltalk at: #C1))).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	100 timesRepeat: block.
	results at: 100 put: (self lubSpaceTallyFor: (Array with: (Smalltalk at: #C1))).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	1000 timesRepeat: block.
	results at: 1000 put: (self lubSpaceTallyFor: (Array with: (Smalltalk at: #C1))).
	self saveResults: results named: 'memory.pharo.1.class'.
	^ results