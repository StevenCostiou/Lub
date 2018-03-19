tests
testRemovingAdaptation
	| instance lub |
	instance := LUBReferenceTestClass new.
	self assert: instance m1 equals: 'reference.m1'.
	lub := LUBAdaptation
		named: 'testRemovingAdaptation'
		adapt: (Array with: #m1 -> #instead)
		with: LUBAdaptationTestClass
		states: #(). 
	instance adaptWith: lub.
	self assert: instance m1 equals: 'adapted.m1'.
	instance revert: lub.
	self assert: instance m1 equals: 'reference.m1'