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


      "`Nestag::x` is the number `123`"
      123
      (nestag) -> nestag.x


      "`Nestag::_x` is private, and is null"
      null
      (nestag) -> nestag[oo._]._x




    ];


