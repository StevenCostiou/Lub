tests
testRemovingAdaptation2Objects
	| instance instance2 lub |
	instance := LUBReferenceTestClass new.
	instance2 := LUBReferenceTestClass new.
	self assert: instance m1 equals: 'reference.m1'.
	lub := LUBAdaptation
		named: 'testRemovingAdaptation'
		adapt: (Array with: #m1 -> #instead)
		with: LUBAdaptationTestClass
		states: #(). 
	instance adaptWith: lub.
	self assert: instance m1 equals: 'adapted.m1'.
	self assert: instance2 m1 equals: 'reference.m1'.
	instance2 adaptWith: lub.
	self assert: instance2 m1 equals: 'adapted.m1'.
	instance revert: lub.
	self assert: instance m1 equals: 'reference.m1'.
	self assert: instance2 m1 equals: 'adapted.m1'.