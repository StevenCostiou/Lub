adapting
adaptObject: target
	| canvasClass links canvasObject |
	canvasClass := (classSpecs at: target class ifAbsent: [ nil ])
		ifNotNil: [ :array | array first ].
	(canvasClass isNil or: [ adaptation mustRecompile ])
		ifTrue: [ canvasObject := target class new.
			links := Set new.
			links := hooks
				collect: [ :hook | 
					| adaptedAst link |
					link := MetaLink new.
					adaptedAst := hook replacementMethod ast.
					hook originalMethod
						ifNil: [ self acquire: adaptedAst withLink: link inObject: canvasObject ]
						ifNotNil: [ self
								control: adaptedAst
								withLink: link
								inObject: canvasObject
								hook: hook ] ].
			metalinks := links asSet.
			canvasClass := canvasObject class.
			(adaptedObjects at: canvasClass ifAbsentPut: [ WeakOrderedCollection new ])
				add: target.
			classSpecs
				at: target class
				put:
					{canvasClass.
					canvasObject}.
			adaptation mustRecompile: false ].
	self bruteMigrationFor: target to: canvasClass.
	^ target