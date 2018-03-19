tests
testSimpleAdaptation
	| instance lub |
	instance := LUBReferenceTestClass new.
	lub := LUBAdaptation
		named: 'testSimpleAdaptation'
		adapt: (Array with: #m1 -> #instead)
		with: LUBAdaptationTestClass
		states: #().
	instance adaptWith: lub.
	self assert: instance m1 equals: 'adapted.m1'.
	self assert: instance m2 equals: 'reference.m2'