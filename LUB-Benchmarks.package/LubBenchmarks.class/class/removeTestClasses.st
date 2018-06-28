benchmarks - memory
removeTestClasses
	1 to: 1000 do: [ :i | 
		| className |
		className := 'C' , i printString.
		(Smalltalk at: className asSymbol) removeFromSystemUnlogged ]