benchmarks - memory
lubMemoryBenchmarkSameClass
	| instances results block a |
	instances := OrderedCollection new.
	results := Dictionary new.
	a := LUBAdaptation
		named: 'aName'
		adapt:
			{(#m1 -> #instead). (#m2 -> #instead). (#m3 -> #acquire). (#m4 -> #acquire).}
		with: (Smalltalk at: #C1)
		states: #().
	block := [ | o |
	o := C new.
	o adaptWith: a.
	instances add: o ].
	Smalltalk garbageCollect.
	10 timesRepeat: block.
	results at: 1 put: (self lubSpaceTallyFor: (instances collect: [ :o | o class ])).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	100 timesRepeat: block.
	results at: 100 put: (self lubSpaceTallyFor: (instances collect: [ :o | o class ])).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	1000 timesRepeat: block.
	results at: 1000 put: (self lubSpaceTallyFor: (instances collect: [ :o | o class ])).
	self saveResults: results named: 'lub-mem-same-class' .
	^ results