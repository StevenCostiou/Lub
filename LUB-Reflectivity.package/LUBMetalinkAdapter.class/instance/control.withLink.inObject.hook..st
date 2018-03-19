adapting - metalinks
control: adaptedAst withLink: link inObject: object hook: hook
	| newSelector originalAst adaptedSource |
	originalAst := hook originalMethod ast.
	link control: hook control.
	link metaObject: object.
	link arguments: hook args.
	originalAst link: link forObject: object.

	"Configuring the new method"
	newSelector := self buildMetaLinkSelectorFrom: adaptedAst selector.
	adaptedSource := adaptedAst compiledMethod getSourceReplacingSelectorWith: newSelector.
	object class compile: adaptedSource.

	"Finishing the link configuration"
	link selector: newSelector.
	^ link