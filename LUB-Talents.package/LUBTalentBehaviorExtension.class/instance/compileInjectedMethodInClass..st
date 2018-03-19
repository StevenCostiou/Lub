installing
compileInjectedMethodInClass: anonSubclass
	| newSelector adaptedSource |
	newSelector := self adaptationMethodSelectorFor: injectedAst selector.
	adaptedSource := injectedAst compiledMethod getSourceReplacingSelectorWith: newSelector.
	anonSubclass compile: adaptedSource