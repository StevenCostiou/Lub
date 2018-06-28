benchmarks - lookup
benchmarkLubLookup
	<script>
	| o a blocks results |
	o := OriginalClass new.
	a := LUBAdaptation
		named: 'aName'
		adapt:
			{(#m1 -> #instead).
			(#m22 -> #acquire).			
			(#m4 -> #acquire)}
		with: AdaptationClass
		states: #().
	o adaptWith: a.
	blocks := self blocksFor: o.
	results := Dictionary new.
	blocks
		do: [ :b | 
			| times |
			times := OrderedCollection new.
			self sampling
				timesRepeat: [ Smalltalk garbageCollect.
					times add: (self benchmarkLookup: b value) ].
			results at: b key put: times ].
	^ results