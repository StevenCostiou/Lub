tests
testNewBehaviorAdaptation
	| instance lub |
	instance := LUBReferenceTestClass new.
	lub := LUBAdaptation
		named: 'testNewBehaviorAdaptation'
		adapt: (Array with: #m4 -> #acquire)
		with: LUBAdaptationTestClass
		states: #().

	"m4 is not know by the original instance"
	self should: [ instance m4 ] raise: MessageNotUnderstood.
	instance adaptWith: lub.

	"m4 adapted and sends self m2, which is not"
	self assert: instance m4 equals: 'reference.m2'