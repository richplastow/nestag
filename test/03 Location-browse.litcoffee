03 Location::browse()
=====================

    tudor.add [
      "03 Location::browse()"
      tudor.is




      "`browse()` is a function which returns a string or an array"

Prepare a test-instance. 

      -> [ new Location { nestag:new Nestag, coord:'abc'} ]


      "`browse()` is a function"
      oo.F
      (location) -> location.browse


      "`browse()` returns a string"
      oo.S
      (location) ->
        location.browse()


      "`browse({format:'array'})` returns an array"
      oo.A
      (location) ->
        location.browse { format:'array' }


      tudor.equal


      "For an empty Location instance, `browse()` returns an empty box"
      """
      .-----------------------------------------------------------------------------.
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                     abc                                     |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      |                                                                             |
      '============================================================================='
      """
      (location) ->
        location.browse()


      "...and `browse({format:'array'})` returns an empty array"
      0
      (location) ->
        location.browse({format:'array'}).length




      "`config` usage"


      "`config.w` and `config.h` can both be zero"
      ''
      (location) ->
        location.browse({w:0, h:0})


      "`config.w` is zero, returns a zero-width column"
      '\n\n\n'
      (location) ->
        location.browse({w:0, h:3})


      "`config.h` is zero, returns an empty string"
      ''
      (location) ->
        location.browse({w:3, h:0})


      "A 1x1 box as expected"
      'c'
      (location) ->
        location.browse({w:1, h:1})


      "A 1x2 box has no border"
      'c\n '
      (location) ->
        location.browse({w:1, h:2})


      "A 7x1 box has no border"
      '  abc  '
      (location) ->
        location.browse({w:7, h:1})


      "A 2x2 box as expected"
      "bc\n''"
      (location) ->
        location.browse({w:2, h:2})


      "A 3x2 box as expected"
      "abc\n'='"
      (location) ->
        location.browse({w:3, h:2})


      "A 2x5 box as expected"
      """
      ..
      ||
      bc
      ||
      ''"""
      (location) ->
        location.browse({w:2, h:5})


      "A 4x4 box as expected"
      """
      .--.
      abc|
      |  |
      '=='"""
      (location) ->
        location.browse({w:4, h:4})




    ];


