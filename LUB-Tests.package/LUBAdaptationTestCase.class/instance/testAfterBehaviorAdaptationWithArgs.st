tests
testAfterBehaviorAdaptationWithArgs
	| instance adaptation |
	instance := LUBReferenceTestClass new.
	adaptation := LUBAdaptation
		named: 'testAfterBehaviorAdaptationWithArgs'
		adapt: (Array with: #writeLog: -> #after)
		with: LUBAdaptationTestClass
		states: #().

	"var is nil"
	instance writeLog: 'coucou'.
	self assert: instance stream contents equals: 'coucou.'.
	instance adaptWith: adaptation.
	instance resetStream.

	"m23 adapted"
	instance writeLog: 'coucou'.
	self assert: instance stream contents equals: 'coucou.adapted.coucou'.
	instance resetStream.

	"removing the adaptation"
	adaptation unadaptObject: instance.
	instance writeLog: 'coucou'.
	self assert: instance stream contents equals: 'coucou.'