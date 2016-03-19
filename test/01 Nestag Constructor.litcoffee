01 Nestag Constructor
=====================

    tudor.add [
      "01 Nestag Constructor"
      tudor.is




      "The class and instance are expected types"

Prepare a test-instance. 

      -> [new Nestag]


      "The Nestag class is a function"
      oo.F
      -> Nestag


      "`new` returns an object"
      oo.O
      (nestag) -> nestag


      tudor.equal


      "`Nestag::C` is 'Nestag'"
      'Nestag'
      (nestag) -> nestag.C


      "`Nestag::toString()` is '[object Nestag]'"
      '[object Nestag]'
      (nestag) -> nestag+''




      "Instance properties as expected"


      tudor.equal


      "`Nestag::nest` is the number `9999`"
      9999
      (nestag) -> nestag.nest


      "`Nestag::_locations` is private, and is an empty object"
      0
      (nestag) -> Object.keys(nestag[oo._]._locations).length




      "`config` usage"


      "`config.grid` takes an array of integers"
      '3,3,3'
      ->
        n = new Nestag { grid:[3,3,3] }
        n.grid.join ','


      "`config.nest` takes an integer"
      123
      ->
        n = new Nestag { nest:123 }
        n.nest


      "`config.nest` can be 0"
      0
      ->
        n = new Nestag { nest:0 }
        n.nest




      "`config.grid` exceptions"


      tudor.throw


      "`config.grid` is a string"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.grid is type string not array"""
      -> new Nestag { grid:'nope' }


      "`config.grid` is not a whole number"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.grid[0] is a number but not an integer"""
      -> new Nestag { grid:[1.5] }


      "`config.grid` is a negative integer"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.grid[1] is -1 (must be 0-999999)"""
      -> new Nestag { grid:[1,-1] }


      "`config.grid` is too big"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.grid[2] is 1000000 (must be 0-999999)"""
      -> new Nestag { grid:[2,3,1000000] }


      "`config.grid` is empty"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.grid.length is 0 (must be 1-24)"""
      -> new Nestag { grid:[] }


      "`config.grid` has too many elements"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.grid.length is 25 (must be 1-24)"""
      -> new Nestag { grid:[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2] }




      "`config.nest` exceptions"


      tudor.throw


      "`config.nest` is boolean `true`"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.nest is type boolean not integer"""
      -> new Nestag { nest:true }


      "`config.nest` is not a whole number"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.nest is a number but not an integer"""
      -> new Nestag { nest:1.5 }


      "`config.nest` is a negative integer"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.nest is -1 (must be 0-999999)"""
      -> new Nestag { nest:-1 }


      "`config.nest` is too big"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.nest is 1000000 (must be 0-999999)"""
      -> new Nestag { nest:1000000 }




    ];


