accessing
blocksFor: object
	| b |
	b := OrderedCollection new.
	b add: ('m' ->[ object m ]).
	b add: ('m1' ->[ object m1 ]).
	b add: ('m21' ->[ object m21 ]).
	b add: ('m22' ->[ object m22 ]).
	"b add: ('m31' ->[ object m31 ])."
	"b add: ('m32' ->[ object m32 ])."
	b add: ('m4' ->[ object m4 ]).
	^ b