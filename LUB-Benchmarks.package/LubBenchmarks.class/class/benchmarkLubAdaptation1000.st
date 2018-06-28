benchmarks - migration
benchmarkLubAdaptation1000
	<script>
	| col a |
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: C new ].
	Smalltalk garbageCollect.
	TimeProfiler
		spyOn: [ col
				do: [ :o | 
					a := LUBAdaptation
						named: 'aName'
						adapt:
							{(#m1 -> #instead).
							(#m2 -> #instead).
							(#m3 -> #acquire).
							(#m4 -> #acquire)}
						with: Cadapt
						states: #().
					o adaptWith: a ] ]