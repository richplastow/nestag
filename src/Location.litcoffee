Location
========

@todo describe in detail


#### Represents a populated coordinate within a Nestag instance

    class Location
      C: 'Location'
      toString: -> '[object Location]'


#### `constructor()`
- `config <object> {}`                          initial configuration
  - `config.coord <string>`                     new Location’s coordinates
  - `config.cargo <array of any> [undefined]`   must contain one or more element
  - `config.tags <array of string|integer> []`  new Location’s tags
- `<undefined>`                                 does not return anything

      constructor: (config={}) ->
        M = '/nestag/src/Location.litcoffee
          Location()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties From `config`
-------------------------------


#### `coord <string>`
New Location’s coordinates. @todo describe in detail

        @coord = v 'coord <string>'


#### `cargo <array of any> [undefined]`
A list of the new Location’s values. Must contain at least one element (even if
that’s `undefined`). If a Location’s cargo elements are all deleted, the 
Location itself is deleted. 

        @cargo = v 'parent <Location|null>'


#### `tags <array of integer> []`
New Location’s tags, by identifier. These can be passed in by identifier or by 
name. Where a name is not recognized, it’s recorded and assigned a globally 
unique identifier. 

        v 'tags <array of string|integer> []'
        @tags = 123 #@todo convert strings to integers




Other Public Properties
-----------------------


#### `ancestors <array of Location|null>`
New Location’s containers. If tags are used, this becomes a ‘sparse array’. 

- `ancestors[0]` is the direct parent of this Location, or `null` if this is the 
  root Location, or if there is no direct parent (a gap in the nested-sequence)
- `ancestors[1]` is the nearest ancestor (parent, grandparent, etc.) to have 
  cargo, and therefore, to have a Location instance. `null` if this is the root
- `ancestors[42]` is the nearest ancestor with tag identifier `42`, or `null` if
  no ancestors have tag identifier `42`

        @ancestors = []


#### `neighbors <array of arrays of Location|null>`
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


#### `corners <array of arrays of Location|null>`
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




Prevent properties being accidentally modified or added to the instance. 

        if 'Location' == @C then oo.lock @




    ;
