benchmarks - memory
generateTestClasses
	1 to: 1000 do: [ :i | 
		| className class |
		className := 'C' , i printString.
		class := C
			subclass: className
			instanceVariableNames: ''
			classVariableNames: ''
			package: 'LUB-C'.
		class compile: 'm1 ^100 printString'.
		class compile: 'm2 ^100 printString'.
		class compile: 'm3 ^100 printString'.
		class compile: 'm4 ^100 printString' ]