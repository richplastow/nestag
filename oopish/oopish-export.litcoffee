Export Module
=============

#### The module’s only entry-point is the `Nestag` class


Prevent properties being accidentally modified or added to the module. 

    oo.lock Nestag

First, try defining an AMD module, eg for [RequireJS](http://requirejs.org/). 

    if oo.F == typeof define and define.amd
      define -> Nestag

Next, try exporting for CommonJS, eg for [Node.js](http://goo.gl/Lf84YI):  
`var Nestag = require('nestag');`

    else if oo.O == typeof module and module and module.exports
      module.exports = Nestag

Otherwise, add the `Nestag` class to global scope.  
Browser usage: `var nestag = new window.Nestag();`

    else oo.G.Nestag = Nestag


    ;
