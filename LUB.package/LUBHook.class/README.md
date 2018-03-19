A LUBHook specifies the adaptation of a method m1 by an other method m2. How m1 is changed by m2 depends on the control. Available control are #acquire, #before, #instead or #after. Default control is #acquire.

Example: 
LUBHook hook: m1 with: m2 control: #before
It means that m2 will be executed before m1. The #instead control would replace m1 by m2 while #after is similar to #before. The #acquire control specifies that the original method is not supposed to exist.


 