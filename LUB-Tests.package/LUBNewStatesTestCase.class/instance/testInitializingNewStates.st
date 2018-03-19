tests
testInitializingNewStates
	| statelessObject lub random |
	statelessObject := LUBStatelessTestClass new.
	self should: [ statelessObject state1 ] raise: MessageNotUnderstood.
	random := (1 to: 1000) atRandom.
	lub := LUBAdaptation
		named: 'testAcquiringNewStates'
		adapt: #()
		with: LUBStatesTestSubClass
		states: (Array with: #state1 -> random).
	statelessObject adaptWith: lub.
	self assert: statelessObject state1 equals: random.
	statelessObject state1: 25.
	self assert: statelessObject state1 equals: 25.
	statelessObject  revert: lub.
	self should: [ statelessObject state1 ] raise: MessageNotUnderstood