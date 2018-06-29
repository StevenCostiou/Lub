utility
computeMeansAndConfidenceIntervalFrom: aDictionnary
	| results |
	results := Dictionary new.
	results
		keysAndValuesDo: [ :key :values | 
			| mean confidenceInterval |
			mean := values average.
			confidenceInterval := self compute95ConfidenceIntervalFor: values.
			results
				at: key
				put:
					{mean.
					confidenceInterval} ].
	^ results