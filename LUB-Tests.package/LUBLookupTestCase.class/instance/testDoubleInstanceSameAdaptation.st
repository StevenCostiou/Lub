tests
testDoubleInstanceSameAdaptation
	| instance instance2 lub |
	instance := LUBReferenceTestClass new.
	instance2 := LUBReferenceTestClass new.
	lub := LUBAdaptation
		named: 'testDoubleInstanceSameAdaptation'
		adapt: (Array with: #m1 -> #instead)
		with: LUBAdaptationTestClass
		states: #().
	instance adaptWith: lub.
	instance2 adaptWith: lub.
	self assert: instance m1 equals: 'adapted.m1'.
	self assert: instance2 m1 equals: 'adapted.m1'