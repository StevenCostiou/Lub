benchmarks
doBenchmarkLookupOnlyDataPharo
	<script>
	| file |
	Smalltalk garbageCollect. 
	file := '/home/steven/pharo.results' asFileReference writeStream.
	file nextPutAll: (STON toString: self benchmarkPharoLookup).
	file close