benchmarks - migration
benchmarkLubAdaptationRevert1000
	<script>
	| col adaptations |
	col := OrderedCollection new.
	adaptations := OrderedCollection new.
	1000 timesRepeat: [ col add: C new ].
	col
		do: [ :o | 
			| a |
			a := LUBAdaptation
				named: 'aName'
				adapt:
					{(#m1 -> #instead).
					(#m2 -> #instead).
					(#m3 -> #acquire).
					(#m4 -> #acquire)}
				with: Cadapt
				states: #().
			adaptations add: a.
			o adaptWith: a ].
	TimeProfiler
		spyOn: [ 1 to: col size do: [ :i | 
				| o a |
				o := col at: i.
				a := adaptations at: i.
				o revert: a ] ]