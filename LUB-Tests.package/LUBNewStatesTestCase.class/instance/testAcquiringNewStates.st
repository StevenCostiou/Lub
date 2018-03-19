tests
testAcquiringNewStates
	| statelessObject lub reference |
	statelessObject := LUBStatelessTestClass new.
	self should: [ statelessObject state1 ] raise: MessageNotUnderstood.
	self should: [ statelessObject state5 ] raise: MessageNotUnderstood.
	lub := LUBAdaptation
		named: 'testAcquiringNewStates'
		adapt: #()
		with: LUBStatesTestSubClass
		states: (Array with: #state1 -> nil with: #state4 -> nil).
	statelessObject adaptWith: lub.
	statelessObject state1: 25.
	self assert: statelessObject state1 equals: 25.
	reference := LUBAdaptationTestClass new.
	statelessObject state4: reference.
	self assert: statelessObject state4 == reference.
	statelessObject revert: lub.
	self should: [ statelessObject state1 ] raise: MessageNotUnderstood.
	self should: [ statelessObject state4 ] raise: MessageNotUnderstood