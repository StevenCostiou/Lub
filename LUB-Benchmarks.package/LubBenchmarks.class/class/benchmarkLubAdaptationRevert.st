benchmarks - migration
benchmarkLubAdaptationRevert
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
	col do: [ :o | o adaptWith: a ].
	col do: [ :o | o revert: a ]