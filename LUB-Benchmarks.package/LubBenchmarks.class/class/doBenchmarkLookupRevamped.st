benchmarks
doBenchmarkLookupRevamped
	<script>
	| results dif str keys |
	results := Dictionary new.
	results at: 'Pharo' put: self benchmarkPharoLookup.
	results at: 'Lub' put: self benchmarkLubLookup.

	dif := Dictionary new.
	str := WriteStream on: String new.
	str nextPutAll: 'Method,Pharo-avg,Lub-avg,Pharo-min/max,Lub-min/max,Pharo-stdev,Lub-stdev,Overhead-avg'.
	str cr.
	keys := (results at: 'Pharo') keys asSortedCollection.
	keys
		do: [ :method | 
			| pharoValues pharoMean pharoMinMax pharoStdev pharoET lubValues lubMean lubMinMax lubStdev lubET|
			pharoValues := (results at: 'Pharo') at: method.
			pharoMean := pharoValues average asFloat.
			pharoMinMax := pharoValues min asFloat printString, '/', pharoValues max asFloat printString.
			pharoStdev := pharoValues stdev asFloat.
			pharoET := (1.96)*(pharoStdev/(self sampling sqrt)) asFloat.
			lubValues := (results at: 'Lub') at: method.
			lubMean := lubValues average asFloat.
			lubMinMax := lubValues min asFloat printString, '/', lubValues max asFloat printString.
			lubStdev := lubValues stdev asFloat.
			lubET := (1.96)*(lubStdev/(self sampling sqrt)) asFloat.
			dif at: method put: (lubMean / pharoMean) asFloat.
			str nextPutAll: method.
			str nextPut: $,.
			str nextPutAll: pharoMean asFloat printString.
			str nextPut: $,.
			str nextPutAll: lubMean asFloat printString.
			str nextPut: $,.
			str nextPutAll: pharoMinMax.
			str nextPut: $,.
			str nextPutAll: lubMinMax.
			str nextPut: $,.
			str nextPutAll: pharoStdev printString.
			str nextPut: $,.
			str nextPutAll: lubStdev printString.
			str nextPut: $,.
			str nextPutAll: pharoET printString.
			str nextPut: $,.
			str nextPutAll: lubET printString.
			str cr ].
	dif at: 'data' put: results.
	dif at: 'sampling' put: self sampling.
	dif at: 'results' put: str contents.
	dif inspect