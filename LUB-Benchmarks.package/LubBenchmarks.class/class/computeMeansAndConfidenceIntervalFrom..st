utility
computeMeansAndConfidenceIntervalFrom: aDictionnary
	| results |
	results := Dictionary new.
	aDictionnary
		keysAndValuesDo: [ :key :values | 
			| mean confidenceInterval |
			mean := values average asFloat.
			confidenceInterval := self compute95ConfidenceIntervalFor: values.
			results
				at: key
				put:
					{mean.
					confidenceInterval.
					(mean - confidenceInterval).
					(mean + confidenceInterval)} ].
	^ results