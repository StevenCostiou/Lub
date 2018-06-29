benchmarks - memory
pharoMemoryBenchmarkDifferentClasses
	| instances results block |
	instances := OrderedCollection new.
	results := Dictionary new.
	block := [ :i | 
	| class |
	class := Smalltalk at: ('C' , i printString) asSymbol.
	instances add: class new ].
	Smalltalk garbageCollect.
	1 to: 10 do: block.
	results at: 10 put: (self lubSpaceTallyFor: (instances collect: [ :o | o class ])).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	1 to: 100 do: block.
	results at: 100 put: (self lubSpaceTallyFor: (instances collect: [ :o | o class ])).
	instances := OrderedCollection new.
	Smalltalk garbageCollect.
	1 to: 1000 do: block.
	results at: 1000 put: (self lubSpaceTallyFor: (instances collect: [ :o | o class ])).
	self saveResults: results named: 'pharo-mem-1000-classes' .
	^ results
	