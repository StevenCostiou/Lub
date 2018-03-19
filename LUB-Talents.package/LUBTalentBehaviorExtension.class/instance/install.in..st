installing
install: hook in: aClass
	originalAst := hook originalMethod ast.
	injectedAst := hook replacementMethod ast.
	"self compileOriginalMethodInClass: aClass."
	self compileInjectedMethodInClass: aClass.
	self compileAdaptedMethodInClass: aClass