01 Location Constructor
=======================

    tudor.add [
      "01 Location Constructor"
      tudor.is




      "The class and instance are expected types"

Prepare a test-instance. 

      -> [new Location { nestag:new Nestag, coord:'a' }]


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


      "`Location::nestag` is a Nestag instance"
      'Nestag'
      (location) -> location.nestag.C


      "`Location::coord` has been set to 'a'"
      'a'
      (location) -> location.coord




      "`config` usage"


      "`config.coord` takes @todo"
      'a'
      ->
        l = new Location { nestag:new Nestag, coord:'a' }
        l.coord


      "The `config.cargo` array can contain any type of value"
      9
      ->
        l = new Location { nestag:new Nestag, coord:'a', cargo:[123,true,Date,'ok',{a:1},/ok/,null,undefined,Infinity] }
        l.cargo.length


      "The `config.tags` array must contain integers"
      5
      ->
        l = new Location { nestag:new Nestag, coord:'a', tags:[6,5,4,3,2] }
        l.tags.length




      "`config.nestag` exceptions"


      tudor.throw


      "`config.nestag` is a plain object"
      """
      /nestag/src/Location.litcoffee Location()
        config.nestag is type object not Nestag"""
      -> new Location { nestag:{}, coord:'a' }




      "`config.coord` exceptions"


      tudor.throw


      "`config.coord` is a number"
      """
      /nestag/src/Location.litcoffee Location()
        config.coord is type number not string"""
      -> new Location { nestag:new Nestag, coord:123 }




      "`config.cargo` exceptions"


      tudor.throw


      "`config.cargo` is a plain object"
      """
      /nestag/src/Location.litcoffee Location()
        config.cargo is type object not array"""
      -> new Location { nestag:new Nestag, coord:'a', cargo:{} }




      "`config.tags` exceptions"


      tudor.throw


      "`config.tags` is a string"
      """
      /nestag/src/Location.litcoffee Location()
        config.tags is type string not array"""
      -> new Location { nestag:new Nestag, coord:'b', tags:'nope' }


      "`config.tags` contains a regexp"
      """
      /nestag/src/Location.litcoffee Location()
        config.tags[1] is type regexp not integer"""
      -> new Location { nestag:new Nestag, coord:'b', tags:[5, /nope/, 6] }


      "`config.tags` contains the number 5.99"
      """
      /nestag/src/Location.litcoffee Location()
        config.tags[3] is a number but not an integer"""
      -> new Location { nestag:new Nestag, coord:'b', tags:[10, 100, 1000, 5.99] }


      "`config.tags` contains the integer 1"
      """
      /nestag/src/Location.litcoffee Location()
        config.tags[2] is 1 (must be 2-999999)"""
      -> new Location { nestag:new Nestag, coord:'b', tags:[999999, 654, 1] }


      "`config.tags` contains zero"
      """
      /nestag/src/Location.litcoffee Location()
        config.tags[0] is 0 (must be 2-999999)"""
      -> new Location { nestag:new Nestag, coord:'b', tags:[0] }


      "`config.tags` contains a million"
      """
      /nestag/src/Location.litcoffee Location()
        config.tags[1] is 1000000 (must be 2-999999)"""
      -> new Location { nestag:new Nestag, coord:'b', tags:[456789, 1000000] }




    ];

