Location
========


#### Represents a populated coordinate within a Nestag instance

    class Location
      C: 'Location'
      toString: -> '[object Location]'


#### `constructor()`
- `config <object> {}`                     initial configuration
  - `config.nestag <Nestag>`               new Location’s container
  - `config.coord <string>`                new Location’s coordinates
  - `config.cargo <[any]> [undefined]`     must contain one or more element
  - `config.tags <[integer 2-999999]> []`  new Location’s tags
- `<undefined>`                            does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/nestag/src/Location.litcoffee
          Location()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public `config` Properties
--------------------------


#### `nestag <Nestag>`
The Location’s container. @todo describe in detail

        @nestag = v 'nestag <Nestag>'


#### `coord <string>`
The Location’s coordinates. @todo describe in detail

        @coord = v 'coord <string>'


#### `cargo <[any]> [undefined]`
A list of the Location’s values. Must contain at least one element (even if 
that’s `undefined`). If a Location’s cargo elements are all deleted, the 
Location itself is deleted. 

        @cargo = oo.vArray(M + 'config.cargo', config.cargo,
          '<[any]>', [undefined])


#### `tags <[integer 2-999999]> []`
The Location’s tags, by identifier. These must refer to a tag in `global_tags`, 
and must not refer to the special 'strict' or 'skip' tags (0 and 1). 

        @tags = oo.vArray(M + 'config.tags', config.tags,
          '<[integer 2-999999]>', [])
        #@todo check for duplicates, check that they refer to actual tags




Other Public Properties
-----------------------


#### `ancestors <[Location|null]>`
New Location’s containers. If tags are used, this becomes a ‘sparse array’. 

- `ancestors[0]` is the direct parent of this Location, or `null` if this is the 
  root Location, or if there is no direct parent (a gap in the nested-sequence)
- `ancestors[1]` is the nearest ancestor (parent, grandparent, etc.) to have 
  cargo, and therefore, to have a Location instance. `null` if this is the root
- `ancestors[42]` is the nearest ancestor with tag identifier `42`, or `null` if
  no ancestors have tag identifier `42`

        @ancestors = []


#### `neighbors <[[Location|null]]>`
Other Locations neighboring this one. Does not record diagonals. 

- A 1D Nestag has `neighbors[0]` for ‘previous’ and `neighbors[1]` for ‘next’
- A 2D Nestag has `neighbors[0]` for ‘North’, `neighbors[1]` for ‘East’, 
  `neighbors[2]` for ‘South’ and `neighbors[3]` for ‘West’
- A 3D Nestag has `neighbors[0/1/2/3]` for ‘North/East/South/West’, plus 
  `neighbors[4]` for ‘Up’ and `neighbors[5]` for ‘Down’

Within each top-level array is a sub-array which works similarly to the 
`ancestors` array: 

- `neighbors[3][0]` is the direct Western neighbor of this Location, or `null` 
  if there is a gap, or this Location is on the Nestag’s Western edge
- `neighbors[2][1]` is the nearest Southern neighbor of this Location which has 
  cargo, or `null` if this Location is on the Nestag’s Southern edge
- `neighbors[4][83]` is the nearest upwards neighbor of this Location with tag 
  identifier `83`, or `null` if no upwards neighbor has tag identifier `83`

        @neighbors = []


#### `corners <[[Location|null]]>`
Locations contained inside this one, positioned at each corner. 

- A 1D Nestag has `corners[0]` for ‘head’ and `corners[1]` for ‘tail’
- A 2D Nestag has `corners[0]` for ‘North West’, `corners[1]` for ‘North East’, 
  `corners[2]` for ‘South East’ and `corners[3]` for ‘South West’
- A 3D Nestag has `corners[0/1/2/3]` for the the ‘Upwards’ set of ‘NW/NE/SE/SW’,
  and `corners[4/5/6/7]` for the the ‘Downwards’ set of ‘NW/NE/SE/SW’ corners

Within each top-level array is a sub-array which works similarly to the 
`ancestors` array: 

- `corners[7][0]` is the direct lower-South-Western corner inside this Location,
  or `null` if that corner has no Location is the next nest-level 
- `corners[6][1]` is the nearest lower-South-Eastern corner inside this Location
  to any nested-depth. This can be the Lower-South-Eastern corner of the 
  Lower-South-Eastern corner. `null` if no such Location exists to any depth
- `corners[4][6]` is the nearest lower-North-Western corner inside this Location
  with tag identifier `6`, or `null` if no such Location exists to any depth

        @corners = []


#### `totals <[integer]>`
Total number of Locations contained inside this one. 

- `totals[0]` is the number of Locations contained directly inside this one
- `totals[1]` is recursive, including all sub-Locations, sub-sub-Locations, etc
- `totals[55]` is recursive but only includes Locations with tag identifier `55`

        @totals = [0,0]




Prevent properties being accidentally modified or added to the instance. 

        if 'Location' == @C then oo.lock @




Public B.R.E.A.D. Methods
-------------------------


#### `browse()`
- `config <object> {}`                            what to show, how to show it
  - `config.format <string ^text|array$> 'text'`  how to format the output
  - `config.tags <[integer 2-999999]> []`         only browse certain tags
  - `config.nest <integer 0-999999> 3`            only browse a certain depth
  - `config.w <integer 1-999> 79`                 width of 'text' output
  - `config.h <integer 1-999> 24`                 height of 'text' output
- `<string|array>`                                depends on `config.format`

@todo describe

      browse: (config={}) ->
        M = '/nestag/src/Location.litcoffee
          Location::browse()\n  '

Check that `config` is valid, and provide fallback values. 

        v = oo.vObject M, 'config', config
        format = v 'format <string ^text|array$>', 'text'
        tags = oo.vArray(M + 'config.tags', config.tags, 
          "<[integer 2-999999]>", [])
        nest = v 'nest <integer 0-999999>',  3
        w    = v 'w <integer 0-999999>'   , 79
        h    = v 'h <integer 0-999999>'   , 24

Deal with an empty Location. 

        if ! @totals[1]
          return if 'array' == format then [] else
            drawBox(w, h, @coord).join '\n'




Prevent properties being accidentally modified or added to the class. 

    oo.lock Location




Private Functions
-----------------

These have module-wide scope. Any code in the Nestag module can access them. 


#### `drawBorder()`
- `w <number>`  width
- `h <number>`  height
- `<[string]>`  each string in the returned array is a line

@todo describe

    drawBorder = (w, h) ->
      M = '/Nestag/src/Location.litcoffee
        drawBorder()\n  '

A box which has a zero or 1 width or height is rendered using spaces. 

      if ! h then return [] # zero height
      if ! w then return Array(h+1).join('x').split('x') # zero width
      if 1 == h then return [oo.pad '', w] # Nx1, eg 1x1 is [' ']
      if 1 == w then return Array(h+1).join(' ').split('') # 1xN

A box 2 characters high only uses the `head` and `foot` lines. 

      head = [ oo.pad('.', w-1, '-') + '.' ]
      foot = [ oo.pad("'", w-1, '=') + "'" ]
      if 2 == h then return head.concat foot

A box higher than 2 characters has left and right borders. 

      line =   oo.pad('|', w-1) + '|'
      body = (line for i in [0..h-3])
      head.concat body, foot




#### `drawBox()`
- `w <number>`      width
- `h <number>`      height
- `coord <string>`  coordinate
- `<[string]>`      each string in the returned array is a line

@todo describe

    drawBox = (w, h, coord) ->
      M = '/Nestag/src/Location.litcoffee
        drawBox()\n  '

      box = drawBorder w, h

A box which has zero width or height does not show the coordinate. 

      if ! h or ! w then return box

Overlay the coordinate on the box’s center (truncate the coord if necessary). 

      if w < coord.length then coord = coord.substr coord.length - w
      mid = if 1 == h then 0 else Math.ceil box.length / 2 - 1
      oo mid
      box[mid] = oo.insert box[mid], coord, (w - coord.length)/2
      return box



    ;
