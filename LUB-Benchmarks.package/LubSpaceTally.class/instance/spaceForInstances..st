as yet unclassified
spaceForInstances: instances
	"Answer a pair of the number of bytes consumed by all instances of the
	 given class, including their object headers, and the number of instances."

	| aClass total |
	instances isEmpty
		ifTrue: [ ^ #(0 0) ].
	total := 0.
	instances
		do: [ :i | 
			aClass := i class.
			aClass isVariable
				ifTrue: [ total := total + (aClass byteSizeOfInstanceOfSize: i basicSize) ]
				ifFalse: [ total := total + aClass byteSizeOfInstance ] ].
	^ {total.
	instances size}