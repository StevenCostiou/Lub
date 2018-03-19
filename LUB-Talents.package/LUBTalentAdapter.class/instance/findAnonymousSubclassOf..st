anon class creation
findAnonymousSubclassOf: aClass
	| table |
	table := LUBAdaptation adaptationsTable.
	table at: adaptation ifAbsentPut: [ WeakKeyDictionary new ].
	^ (table at: adaptation) at: aClass ifAbsent: [ nil ]