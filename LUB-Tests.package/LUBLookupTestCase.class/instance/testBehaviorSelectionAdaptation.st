tests
testBehaviorSelectionAdaptation
	| instance lub |
	instance := LUBReferenceTestClass new.
	lub := LUBAdaptation
		named: 'test'
		adapt: (Array with: #m3 -> #instead)
		with: LUBAdaptationTestClass
		states: #().
	instance adaptWith: lub.

	"Only m3 is adapted"
	self assert: instance m1 equals: 'reference.m1'.
	self assert: instance m3 equals: 'adapted.m3'.
	self should: [ instance m4 ] raise: MessageNotUnderstood