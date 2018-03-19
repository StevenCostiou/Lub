generation
generateStatesForObject: anObject
	states
		do: [ :stateSpec | objectAdapter addStateNamed: stateSpec key initializeWith: stateSpec value ]