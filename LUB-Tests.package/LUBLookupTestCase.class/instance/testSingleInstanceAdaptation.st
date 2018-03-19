tests
testSingleInstanceAdaptation
	| instance instance2 lub |
	instance := LUBReferenceTestClass new.
	instance2 := LUBReferenceTestClass new.
	lub := LUBAdaptation
		named: 'testSingleInstanceAdaptation'
		adapt: (Array with: #m1 -> #instead)
		with: LUBAdaptationTestClass
		states: #().
	instance adaptWith: lub.
	self assert: instance m1 equals: 'adapted.m1'.
	self assert: instance2 m1 equals: 'reference.m1'