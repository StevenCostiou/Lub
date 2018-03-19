tests
testSelfSendsInAdaptation
	| instance lub |
	instance := LUBReferenceTestClass new.
	lub := LUBAdaptation
		named: 'testSelfSendsInAdaptation'
		adapt: (Array with: #m4 -> #acquire)
		with: LUBAdaptationTestClass
		states: #().
	instance adaptWith: lub.

	"m4 adapted and sends self m2, which is not"
	self assert: instance m4 equals: 'reference.m2'