benchmarks - memory
spaceUsedBy: aClass
	| space |
	space := 0.
	aClass
		methodsDo: [ :m | 
			| method |
			method := m class == ReflectiveMethod
				ifTrue: [ | links |
					links := (m ast allChildren flatCollect: [ :n | n links ifNil: [ #() ] ]) select: [ :l | l notNil ].
					space := space + (links inject: 0 into: [ :sum :link | sum + link sizeInMemory ]).
					space := space + m sizeInMemory.
					m compiledMethod ]
				ifFalse: [ m ].
			space := space + 16.	"dict and org'n space"
			space := space + (method size + 6).	"hdr + avg pad"
			method
				literalsDo: [ :lit | 
					(lit isMemberOf: Array)
						ifTrue: [ space := space + ((lit size + 1) * 4) ].
					(lit isMemberOf: Float)
						ifTrue: [ space := space + 12 ].
					(lit isMemberOf: ByteString)
						ifTrue: [ space := space + (lit size + 6) ].
					(lit isMemberOf: LargeNegativeInteger)
						ifTrue: [ space := space + ((lit size + 1) * 4) ].
					(lit isMemberOf: LargePositiveInteger)
						ifTrue: [ space := space + ((lit size + 1) * 4) ] ] ].
	^ space