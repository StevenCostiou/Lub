baselines
baseline: spec
	<baseline>
	spec
		for: #common 
		do: [ spec
				baseline: 'ReflectivityDev'
				with: [ spec repository: 'github://StevenCostiou/Reflectivity-dev/repository' ].
			spec blessing: #baseline.
			spec repository: 'github://StevenCostiou/Lub'.
			spec description: 'LookUpBase pattern implementation'.
			spec package: 'LUB'.
			spec package: 'LUB-Reflectivity'.
			spec package: 'LUB-Talents'.
			spec package: 'LUB-Tests'.
			spec postLoadDoIt: #postLoadLubSetup ]