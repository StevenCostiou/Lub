benchmarks - memory
lubSpaceTallyFor: classes
	| lubTallies tally |
	lubTallies := LubSpaceTally new spaceTally: classes asSet.
	tally := SpaceTallyItem new.
	tally codeSize: (classes asSet inject: 0 into: [ :sum :i | sum + (self spaceUsedBy: i) ]).
	tally instanceCount: (lubTallies inject: 0 into: [ :sum :i | sum + i instanceCount ]).
	tally spaceForInstances: (lubTallies inject: 0 into: [ :sum :i | sum + i spaceForInstances ]).
	^ tally