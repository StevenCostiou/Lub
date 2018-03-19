tests
testDoubleInstanceDifferentAdaptation
	| instance instance2 lub lub2 |
	instance := LUBReferenceTestClass new.
	instance2 := LUBReferenceTestClass new.
	lub := LUBAdaptation
		named: 'testDoubleInstanceDifferentAdaptation-1'
		adapt: (Array with: #m1 -> #instead)
		with: LUBAdaptationTestClass
		states: #().
	instance adaptWith: lub.
	lub2 := LUBAdaptation
		named: 'testDoubleInstanceDifferentAdaptation-2'
		adapt: (Array with: #m2 -> #instead)
		with: LUBAdaptationTestClass
		states: #().
	instance2 adaptWith: lub2.
	self assert: instance m1 equals: 'adapted.m1'.
	self assert: instance m2 equals: 'reference.m2'.
	self assert: instance2 m1 equals: 'reference.m1'.
	self assert: instance2 m2 equals: 'adapted.m2'