utility
compute95ConfidenceIntervalFor: values
	^ 1.96 * (values stdev / values size sqrt) asFloat