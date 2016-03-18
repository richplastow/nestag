Oopish Constants
================

#### Define the core Oopish constants

Oopish constants are visible to all code defined in ‘src/’ and ‘test/’, but 
hidden from code defined elsewhere in the app. 




Constants which help minification
---------------------------------

These strings can make `*.min.js` a little shorter and easier to read, and also 
make the source code less verbose: `oo.O == typeof x` vs `'object' == typeof x`.

    oo.A = 'array'
    oo.B = 'boolean'
    #       oo.C is not used, to avoid confusion with a class’s `C` property
    oo.D = 'document' #@todo maybe 'defined' instead, ie not 'undefined'
    oo.E = 'error'
    oo.F = 'function'
    #       oo.G is the `global` context, see `oopish/bin/oopish-build:topJs()`
    oo.I = 'integer'
    #       oo.M is not used, to avoid confusion with a method’s `M` variable
    oo.N = 'number'
    oo.O = 'object'
    oo.R = 'regexp'
    oo.S = 'string'
    #       oo.T is the project title, see `oopish/bin/oopish-build:topJs()`
    oo.U = 'undefined'
    #       oo.V is the project version, see `oopish/bin/oopish-build:topJs()`
    oo.X = 'null'




The Privacy Constant
--------------------

Provides an unguessable prefix for private instance members. 

    oo._ = ( Math.random().toString(36) + '00000000' ).substr 2,8




Environmental Constants
-----------------------

Determine whether the current runtime environment can be made ‘robust’. @todo explain ‘robust’

    oo.ROBUSTABLE = unless Object.preventExtensions then false # eg Safari 5
    else if Object.defineProperty
      try Object.defineProperty({},'x',{}); true # for IE8, see goo.gl/9Nw00S
      catch then false
    else true

@todo more environmental constants

    ;

