Nestag
======

@todo describe


#### The main class for Nestag

    class Nestag
      C: 'Nestag'
      toString: -> '[object Nestag]'


#### `constructor()`
- `config <object> {}`       initial configuration
  - `config.x <number> 123`  @todo describe
- `<undefined>`              does not return anything

      constructor: (config={}) ->
        M = '/nestag/src/Nestag.litcoffee
          Nestag()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `x <number> 123`
From `config.x`, @todo describe

        @x = v 'x <number>', 123




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'


#### `_x <null>`
@todo describe

        @[oo._]._x = null




Prevent properties being accidentally modified or added to the instance. 

        if 'Nestag' == @C then oo.lock @




Public Methods
--------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

      xx: (yy) ->
        M = '/nestag/src/Nestag.litcoffee
          Nestag::xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        yy = oo.vArg M, yy, 'yy <number>', 123




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    Nestag.xx = (yy) ->
      M = '/nestag/src/Nestag.litcoffee
        Nestag.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123





Private Variables and Functions 
-------------------------------

These have module-wide scope. Any code in the Nestag module can access them. 


#### `x <null>`
@todo describe

    x = null


#### `xx()`
- `yy <number>`  @todo describe
- `<undefined>`  does not return anything

To simulate a private method, use `xx.call(@, yy)`. @todo describe

    xx = (yy) ->
      M = '/nestag/src/Nestag.litcoffee
        xx()\n  '




    ;
