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




    ];


