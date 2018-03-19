anon class creation
newAnonymousSubclassFor: anObject
	| class |
	class := anObject class newAnonymousSubclass.
	self buildSlots do: [ :slot | class := class addSlot: slot ].
	(LUBAdaptation adaptationsTable at: adaptation) at: anObject class put: class.
	^ class