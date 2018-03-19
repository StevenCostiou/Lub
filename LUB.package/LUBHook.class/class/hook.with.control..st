instance creation
hook: aMethod with: anOtherMethod control: control
	|hook|
	hook := self new.
	hook originalMethod: aMethod.
	hook replacementMethod: anOtherMethod.
	hook control: control.
	^hook
	