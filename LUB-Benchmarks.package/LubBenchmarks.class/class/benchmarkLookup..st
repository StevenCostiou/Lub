benchmarks - lookup
benchmarkLookup: aBlock
	^ [ self iterations timesRepeat: aBlock ] timeToRunWithoutGC 