adapting - metalinks
acquire: adaptedAst withLink: link inObject: object
	"Acquire trick: we put a fake link on a method known by all objects.
	The chosen method is #yourself. Its behavior is not changed."

	| originalAst |
	originalAst := (object class lookupSelector: #yourself) ast.
	link disable.
	originalAst link: link forObject: object.
	object class compile: adaptedAst sourceCode.
	^ link