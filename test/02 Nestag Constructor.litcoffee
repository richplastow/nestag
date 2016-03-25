02 Nestag Constructor
=====================

    tudor.add [
      "02 Nestag Constructor"
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




      "Default instance properties as expected"


      tudor.equal


      "`Nestag::grid` is the array `[2,2]`"
      '2x2'
      (nestag) -> nestag.grid.join 'x'


      "`Nestag::nest` is the number `9999`"
      9999
      (nestag) -> nestag.nest


      "`Nestag::scheme` is the string 'continuous'"
      'continuous'
      (nestag) -> nestag.scheme


      "`Nestag::form` is the string 'short'"
      'short'
      (nestag) -> nestag.form


      "`Nestag::_locations` is private, and is an empty object"
      0
      (nestag) -> Object.keys(nestag[oo._]._locations).length




      "`config` usage"


      "`config.grid` takes an array of integers"
      '3x3x3'
      ->
        n = new Nestag { grid:[3,3,3] }
        n.grid.join 'x'


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


      "`config.scheme` can be 'continuous' or 'dimensional'"
      'continuous or dimensional'
      ->
        n1 = new Nestag { scheme:'continuous' }
        n2 = new Nestag { scheme:'dimensional' }
        n1.scheme + ' or ' + n2.scheme


      "`config.form` can be 'long' or 'short'"
      'long or short'
      ->
        n1 = new Nestag { form:'long' }
        n2 = new Nestag { form:'short' }
        n1.form + ' or ' + n2.form




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
        config.grid.length is 0 (must be 1-99)"""
      -> new Nestag { grid:[] }


      "`config.grid` has too many elements"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.grid.length is 100 (must be 1-99)"""
      -> new Nestag { grid:[1..100] }




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




      "`config.scheme` exceptions"


      tudor.throw


      "`config.scheme` is a regexp"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.scheme is type regexp not string"""
      -> new Nestag { scheme:/continuous/ }


      "`config.scheme` is not a valid keyword (should be lowercase)"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.scheme fails ^continuous|dimensional$"""
      -> new Nestag { scheme:'CONTINUOUS' }




      "`config.form` exceptions"


      tudor.throw


      "`config.form` is an array"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.form is type array not string"""
      -> new Nestag { form:['l','o','n','g'] }


      "`config.scheme` is not a valid keyword (should be lowercase)"
      """
      /nestag/src/Nestag.litcoffee Nestag()
        config.form fails ^short|long$"""
      -> new Nestag { form:'Long' }




    ];


