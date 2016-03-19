02 Location Constructor
=======================

    tudor.add [
      "02 Location Constructor"
      tudor.is




      "The class and instance are expected types"

Prepare a test-instance. 

      -> [new Location { coord:'a' }]


      "The Location class is a function"
      oo.F
      -> Location


      "`new` returns an object"
      oo.O
      (location) -> location


      tudor.equal


      "`Location::C` is 'Location'"
      'Location'
      (location) -> location.C


      "`Location::toString()` is '[object Location]'"
      '[object Location]'
      (location) -> location+''




      "Instance properties as expected"


      tudor.equal


      "`Location::coord` has been set to 'a'"
      'a'
      (location) -> location.coord




      "`config` usage"


      "`config.coord` takes @todo"
      'a'
      ->
        l = new Location { coord:'a' }
        l.coord




      "`config.tags` exceptions"


      tudor.throw


      "`config.tags` is a string"
      """
      /nestag/src/Location.litcoffee Location()
        config.tags is type string not array"""
      -> new Location { coord:'b', tags:'nope' }




    ];


