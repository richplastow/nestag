06 Nestag::add()
=====================

    tudor.add [
      "06 Nestag::add()"
      tudor.is




      "`add()` is a function which returns a string or an array"

Prepare a test-instance. 

      -> [ new Nestag ]


      "`add()` is a function"
      oo.F
      (nestag) -> nestag.add


      "`add()` returns a string (the coord of the added cargo’s Location)"
      oo.S
      -> (new Nestag).add()


      tudor.equal


      "`add()` returns the empty string, which is the root (level-0) coord"
      ''
      -> (new Nestag).add()




      "`config` usage"


      "First, the number `1` can be added to a level-1 coord"
      """
      .--.----a-------.
      |n1:            |
      |  :            |
      '=='============'"""
      (nestag) ->
        nestag.add { coord:'a', cargo:[1] }
        nestag.browse { coord:'a', w:17, h:4 }




    ];


