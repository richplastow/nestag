01 Nestag Constructor
=======================


    tudor.add [
      "01 Nestag Constructor"
      tudor.is




      "The class and instance are expected types"

Prepare a test-instance. 

      -> [new Nestag]


      "The Nestag class is a function"
      oo.F
      -> Nestag


      "Cannot add a property to the Nestag class"
      oo.U
      -> Nestag.nope = 123; Nestag.nope


      "`new` returns an object"
      oo.O
      (nestag) -> nestag


      "Cannot add a property to the Nestag class’s prototype object"
      oo.U
      (nestag) -> Nestag::nope = 456; nestag.nope


      tudor.equal


      "`Nestag::C` is 'Nestag'"
      'Nestag'
      (nestag) -> nestag.C


      "`Nestag::C` is a constant"
      'Nestag'
      (nestag) -> nestag.C = 'changed!'; nestag.C


      "`Nestag::toString()` is '[object Nestag]'"
      '[object Nestag]'
      (nestag) -> nestag+''




      "Instance properties as expected"


      tudor.equal

      "An instance has enumerable properties as expected"
      '{"x":123}'
      (nestag) -> JSON.stringify nestag


      "`Nestag::x` is the number `123`"
      123
      (nestag) -> nestag.x


      "`Nestag::_x` is private, and is null"
      null
      (nestag) -> nestag[oo._]._x




    ];
