instance-creation
named: aName adapt: hooksSpec with: aClass states: states
	| adaptation |
	adaptation := self new.
	adaptation name: aName.
	adaptation referenceClass: aClass.
	adaptation hooks: hooksSpec.
	adaptation states: states.
	adaptation objectAdapter: (self objectAdapterClass on: adaptation).
	^ adaptation