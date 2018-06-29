benchmarks
doBenchmarkLookupOnlyDataPharo
	<script>
	| file |
	Smalltalk garbageCollect. 
	file := '/home/steven/lub-benchmarks/pharo.results' asFileReference writeStream.
	file nextPutAll: (STON toString: self benchmarkPharoLookup).
	file close