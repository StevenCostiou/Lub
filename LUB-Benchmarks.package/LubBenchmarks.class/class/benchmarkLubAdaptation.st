benchmarks - migration
benchmarkLubAdaptation
	<script>
	| col a |
	col := OrderedCollection new.
	1000 timesRepeat: [ col add: C new ].
	a := LUBAdaptation
		named: 'aName'
		adapt:
			{(#m1 -> #instead).
			(#m2 -> #instead).
			(#m3 -> #acquire).
			(#m4 -> #acquire)}
		with: Cadapt
		states: #().
	TimeProfiler spyOn: [col do: [ :o | o adaptWith: a ]]