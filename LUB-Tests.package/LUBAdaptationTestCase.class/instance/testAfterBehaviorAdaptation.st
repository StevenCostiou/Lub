tests
testAfterBehaviorAdaptation
	| instance adaptation |
	instance := LUBReferenceTestClass new.
	adaptation := LUBAdaptation
		named: 'testAfterBehaviorAdaptation'
		adapt: (Array with: #m23 -> #after)
		with: LUBAdaptationTestClass
		states: #().

	"var is nil"
	instance m23.
	self assert: instance stream contents equals: 'reference.m23.'.
	instance adaptWith: adaptation.
	instance resetStream.

	"m23 adapted"
	adaptation adaptObject: instance.
	instance m23.
	self assert: instance stream contents equals: 'reference.m23.log.'.
	instance resetStream.

	"removing the adaptation"
	adaptation unadaptObject: instance.
	instance m23.
	self assert: instance stream contents equals: 'reference.m23.'