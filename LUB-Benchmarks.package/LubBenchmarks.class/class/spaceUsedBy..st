benchmarks - memory
spaceUsedBy: i
	| methods codeSize |
	methods := i methods.
	codeSize := 0.
	methods
		do: [ :m | 
			codeSize := codeSize + m sizeInMemory.
			m class == ReflectiveMethod
				ifTrue: [ | links |
					links := (m ast allChildren flatCollect: [ :n | n links ifNil: [ #() ] ]) select: [ :l | l notNil ].
					codeSize := codeSize + (links inject: 0 into: [ :sum :link | sum + link sizeInMemory ]) ] ].
	^ codeSize