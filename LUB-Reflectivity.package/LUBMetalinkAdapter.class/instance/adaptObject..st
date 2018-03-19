adapting
adaptObject: anObject
	| links |
	links := Set new.
	links := hooks
		collect: [ :hook | 
			| adaptedAst link |
			link := MetaLink new.
			adaptedAst := hook replacementMethod ast.
			hook originalMethod
				ifNil: [ self acquire: adaptedAst withLink: link inObject: anObject ]
				ifNotNil: [ self
						control: adaptedAst
						withLink: link
						inObject: anObject
						hook: hook ] ].
	metalinks at: anObject put: links asSet.
	^ anObject