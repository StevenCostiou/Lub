class analysis
preAllocateResultsFor: classes
	results := OrderedCollection new: classes size.
	classes
		do: [ :cl | 
			results
				add:
					(LubTallyItem new
						analyzedClass: cl;
						yourself) ].
	results := results asArray