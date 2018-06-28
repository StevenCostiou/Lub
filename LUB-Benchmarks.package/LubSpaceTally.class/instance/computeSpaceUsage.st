class analysis
computeSpaceUsage
	| entry c instanceCount |
	1 to: results size do: [ :i | 
		entry := results at: i.
		c := entry analyzedClass.
		instanceCount := c instanceCount.
		entry codeSize: c spaceUsed.
		entry instanceCount: instanceCount.
		entry spaceForInstances: c instancesSizeInMemory.
		Smalltalk garbageCollectMost ]