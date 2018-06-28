benchmarks
doBenchmarkLookup
	<script>
	| results dif str keys |
	results := Dictionary new.
	results at: 'Pharo' put: self benchmarkPharoLookup.
	results at: 'Lub' put: self benchmarkLubLookup.

	dif := Dictionary new.
	str := WriteStream on: String new.
	str nextPutAll: 'Method,Pharo,Lub'.
	str cr.
	keys := (results at: 'Pharo') keys asSortedCollection.
	keys
		do: [ :method | 
			| pharoValues pharoMean lubValues lubMean |
			pharoValues := (results at: 'Pharo') at: method.
			pharoMean := (pharoValues inject: 0 into: [ :i :sum | sum + i ])
				/ self sampling asFloat.
			lubValues := (results at: 'Lub') at: method.
			lubMean := (lubValues inject: 0 into: [ :i :sum | sum + i ]) / self sampling asFloat.
			dif at: method put: (lubMean / pharoMean) asFloat.
			str nextPutAll: method.
			str nextPut: $,.
			str nextPutAll: pharoMean asFloat printString.
			str nextPut: $,.
			str nextPutAll: lubMean asFloat printString.
			str cr ].
	dif at: 'data' put: results.
	dif at: 'sampling' put: self sampling.
	dif at: 'results' put: str contents.
	dif inspect