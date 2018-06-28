benchmarks
doBenchmarkLookupRevampedSimplified
	<script>
	| results dif str keys |
	results := Dictionary new.
		results at: 'Lub' put: self benchmarkLubLookup.
	results at: 'Pharo' put: self benchmarkPharoLookup.


	dif := Dictionary new.
	str := WriteStream on: String new.
	str nextPutAll: 'Method,Pharo-avg,Lub-avg,Pharo-ET,Lub-ET'.
	str cr.
	keys := (results at: 'Pharo') keys asSortedCollection.
	keys
		do: [ :method | 
			| pharoValues pharoMean pharoStdev pharoET lubValues lubMean lubStdev lubET|
			pharoValues := (results at: 'Pharo') at: method.
			pharoMean := pharoValues average asFloat.
			pharoStdev := pharoValues stdev asFloat.
			pharoET := (1.96)*(pharoStdev/(self sampling sqrt)) asFloat.
			lubValues := (results at: 'Lub') at: method.
			lubMean := lubValues average asFloat.
			lubStdev := lubValues stdev asFloat.
			lubET := (1.96)*(lubStdev/(self sampling sqrt)) asFloat.
			dif at: method put: (lubMean / pharoMean) asFloat.
			str nextPutAll: method.
			str nextPut: $,.
			str nextPutAll: pharoMean asFloat printString.
			str nextPut: $,.
			str nextPutAll: lubMean asFloat printString.
			str nextPut: $,.
			str nextPutAll: pharoET printString.
			str nextPut: $,.
			str nextPutAll: lubET printString.
			str cr ].
	dif at: 'data' put: results.
	dif at: 'sampling' put: self sampling.
	dif at: 'results' put: str contents.
	dif inspect