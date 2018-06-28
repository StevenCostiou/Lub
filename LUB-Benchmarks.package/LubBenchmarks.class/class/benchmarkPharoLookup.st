benchmarks - lookup
benchmarkPharoLookup
	<script>
	| o blocks results |
	o := AdaptedClass new.
	blocks := self blocksFor: o.
	results := Dictionary new.
	blocks
		do: [ :b | 
			| times |
			times := OrderedCollection new.
			self sampling
				timesRepeat: [ Smalltalk garbageCollect.
					times add: (self benchmarkLookup: b value) ].
			results at: b key put: times  ].
	^ results