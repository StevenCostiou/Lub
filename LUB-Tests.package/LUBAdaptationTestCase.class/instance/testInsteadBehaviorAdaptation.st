tests
testInsteadBehaviorAdaptation
	| instance adaptation |
	instance := LUBReferenceTestClass new.
	adaptation := LUBAdaptation
		named: 'testBeforeBehaviorAdaptation'
		adapt: (Array with: #m2 -> #instead)
		with: LUBAdaptationTestClass
		states: #().
	"m22 is the original behavior"
	self assert: instance m2 equals: 'reference.m2'.
	instance adaptWith: adaptation.

	"m22 adapted"
	self assert: instance m2 equals: 'adapted.m2'.

	"removing the adaptation"
	adaptation unadaptObject: instance.
	self assert: instance m2 equals: 'reference.m2'