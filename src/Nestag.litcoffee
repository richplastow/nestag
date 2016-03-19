Nestag
======

@todo describe


#### The main class for Nestag

    class Nestag
      C: 'Nestag'
      toString: -> '[object Nestag]'


#### `constructor()`
- `config <object> {}`                           initial configuration
  - `config.grid <array of integer|null> [2,2]`  defines dimensions and size
  - `config.nest <integer> 9999`                 maximum nest-depth
- `<undefined>`                                  does not return anything

      constructor: (config={}) ->
        M = '/nestag/src/Nestag.litcoffee
          Nestag()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `grid <array of integer or null> [null]`
One element per dimension. If the element is a number, it defines the grid 
extent in that direction. If the element is `null`, there is no fixed number of 
locations in that direction @todo how does that work with coords?

The default,`[2,2]`, is a 2D grid where each Location has four sub-Locations. 

        @grid = v 'grid <array of integer|null>', [2,2]


#### `nest <integer> 9999`
The deepest number of nested levels allowed. You can set this to a very high 
number, but the JavaScript runtime environment will hit a call-stack limit at 
some point. Setting `nest` to 0 prevents any nesting, so only the top-level 
Location can be used. 

        @nest = v 'nest <integer>', 9999




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'


#### `_locations <object>`
Contains all Location instances currently held by this Nestag instance. 

        @[oo._]._locations = {}




Prevent properties being accidentally modified or added to the instance. 

        if 'Nestag' == @C then oo.lock @




Public B.R.E.A.D. Methods
-------------------------


      #@todo




    ;
