Nestag
======


#### The main class for Nestag

    class Nestag
      C: 'Nestag'
      toString: -> '[object Nestag]'


#### `constructor()`
- `config <object> {}`                            initial configuration
  - `config.grid <[integer 0-999999]1-99> [2,2]`  defines dimensions and size
  - `config.nest <integer 0-999999> 9999`         maximum nest-depth
  - `config.scheme <string> 'continuous'`         the coordinate-scheme
  - `config.form <string> 'short'`                use long-form or short-form
- `<undefined>`                                   does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/nestag/src/Nestag.litcoffee
          Nestag()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `grid <[integer 0-999999]1-99> [null]`
One integer per dimension. If the integer is zero, there is no fixed number of 
locations in that direction @todo how does that work with coords? If the integer
is greater than 0, it defines the grid extent in that direction. 

The default is a 2D grid where each Location has four sub-Locations, `[2,2]`. 

        @grid = oo.vArray(M + 'config.grid', config.grid,
          '<[integer 0-999999]1-99>', [2,2])


#### `nest <integer> 9999`
The deepest number of nested levels allowed. You can set this to a very high 
number, but the JavaScript runtime environment will hit a call-stack limit at 
some point. Setting `nest` to 0 prevents any nesting, so only the top-level 
Location can be used. 

        @nest = v 'nest <integer 0-999999>', 9999


#### `scheme <string ^continuous|dimensional$> 'continuous'`
'continuous' assigns the origin coord 'a', and then proceeds in a z-order curve 
with 'b', 'c', 'd' etc. If more than 26 coords are needed, two or more chars are
used, so the origin is 'aa', followed by 'ab', 'ac' ... 'az', 'ba', etc.  
'dimensional' uses one character per dimension. The origin of a 3D grid is 
'a,a,a', and its adjacent coords are 'b,a,a', 'a,b,a' and 'a,a,b' (long-form). 
Short-form of these coords is 'aaa', 'baa', 'aba' and 'aab'. If any dimension 
has more than 26 divisions, two or more characters are used, eg 'qj,m,znhi'. 

        @scheme = v 'scheme <string ^continuous|dimensional$>', 'continuous'


#### `form <string ^short|long$> 'short'`
Long-form uses commas and slashes to make coordinates easier to read, eg for a 
2x2x2 grid with 'dimensional' scheme, 'a,a,a/b,b,b' is the long-form coord of 
the short-form coord 'aaabbb'. The equivalent coord in the 'continuous' scheme 
is 'a/h' in long-form, or 'ah' in short-form. 

        @form = v 'form <string ^short|long$>', 'short'




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'


#### `_locations <object>`
Location instances currently held by this Nestag instance, with coords as keys. 

        @[oo._]._locations = {}


#### `_totalLocations <integer>`
The number of Nestag instances in `_locations`. 

        @[oo._]._totalLocations = 0




Prevent properties being accidentally modified or added to the instance. 

        if 'Nestag' == @C
          oo.lock @grid # prevent array elements being changed
          oo.lock @




Public B.R.E.A.D. Methods
-------------------------


#### `browse()`
- `config <object> {}`                            what to show, how to show it
  - `config.coord <string> ''`                    the outermost Location to show
  - `config.format <string ^text|array$> 'text'`  how to format the output
  - `config.tags <[integer 2-999999]> []`         only browse certain tags
  - `config.nest <integer 0-999999> 3`            only browse to a certain depth
  - `config.w <integer 1-999> 79`                 width of 'text' output
  - `config.h <integer 1-999> 24`                 height of 'text' output
- `<string|array>`                                depends on `config.format`

@todo describe  
See also `Location::browse()`. 

      browse: (config={}) ->
        M = '/nestag/src/Nestag.litcoffee
          Nestag::browse()\n  '

Begin checking that `config` is valid. The Location will check that the rest of 
`config` is valid, and provide the remaining fallback values. 

        v = oo.vObject M, 'config', config
        coord = v "coord <string #{COORD_RULE}>", ''
        location = @[oo._]._locations[coord]
        if ! location then throw RangeError M + "
          coord '#{coord}' does not exist"

Return the `browse()` result from the Location specified by `coord`. 

        location.browse config




#### `add()`
- `config <object> {}`                  what to add, where to add it
  - `config.coord <string> ''`          a Location to add the cargo to
  - `config.cargo <[any]> [undefined]`  an array of values to add
  - `config.tags <[string]> []`         optional labels for the Location
- `<string>`                            coord of the cargo’s Location

@todo describe  

      add: (config={}) ->
        M = '/nestag/src/Nestag.litcoffee
          Nestag::add()\n  '

Check that `config` is valid, and provide fallback values. 

        v = oo.vObject M, 'config', config
        coord = v "coord <string #{COORD_RULE}>", ''
        cargo = oo.vArray(M + 'config.cargo', config.cargo 
          "<[any]>", [undefined])
        tags = oo.vArray(M + 'config.tags', config.tags,
          "<[string #{TAG_RULE}]>", [])

Create a numeric identifier for unrecognized tags. 

        #@todo

Add the cargo to the specified Location. Create a Location at the specified 
coord if it does not already exist. 

        location = @[oo._]._locations[coord]
        if location
          location.add { cargo:cargo }
        else
          location = new Location { nestag:@, coord:coord, cargo:cargo }#@todo tags
          @[oo._]._locations[coord] = location
          @[oo._]._totalLocations++

Return the same coord that was passed in. 

        coord


    ;
