benchmarks
doBenchmarkLookupOnlyDataLub
	<script>
	| file |
	Smalltalk garbageCollect.
	file := '/home/steven/lub-benchmarks/lub.results' asFileReference writeStream.
	file nextPutAll: (STON toString: self benchmarkLubLookup).
	file close