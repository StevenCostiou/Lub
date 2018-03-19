tests
testObjectIdentityAfterAdaptation
	| originalClass instance adaptedInstance recoveredInstance lub |
	originalClass := LUBReferenceTestClass.
	instance := originalClass new.
	self assert: instance m1 equals: 'reference.m1'.
	lub := LUBAdaptation
		named: 'testObjectIdentityAfterAdaptation'
		adapt: (Array with: #m1 -> #acquire)
		with: LUBAdaptationTestClass
		states: #().
	adaptedInstance := instance adaptWith: lub.
	self assert: instance == adaptedInstance.
	self assert: originalClass ~= instance class.
	self assert: instance class superclass == originalClass.
	recoveredInstance := instance revert: lub.
	self assert: instance == recoveredInstance