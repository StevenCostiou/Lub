baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'ReflectivityDev'
				with: [ spec repository: 'https://github.com/StevenCostiou/Reflectivity-dev/repository' ].
			spec blessing: #baseline.
			spec repository: 'https://github.com/StevenCostiou/Lub'.
			spec description: 'LookUpBase pattern implementation'.
			spec package: 'LUB'.
			spec package: 'LUB-Reflectivity'.
			spec package: 'LUB-Talents'.
			spec package: 'LUB-Tests' ]