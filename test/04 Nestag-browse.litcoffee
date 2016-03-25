04 Nestag::browse()
=====================

    tudor.add [
      "04 Nestag::browse()"
      tudor.is




      "`browse()` is a function which returns a string or an array"

Prepare a test-instance. 

      ->
        nestag = new Nestag
        nestag.add { cargo:['Level 0'] }
        [ nestag ]


      "`browse()` is a function"
      oo.F
      (nestag) -> nestag.browse


      "`browse()` returns a string"
      oo.S
      (nestag) ->
        nestag.browse()


      "`browse({format:'array'})` returns an array"
      oo.A
      (nestag) ->
        nestag.browse { format:'array' }


      tudor.equal


      "For the initial test-instance, `browse({ w:20, h:5 })` returns a string..."
      """
      .--.---------------.
      |s1:               |
      |  :               |
      |  :               |
      '=='==============='"""
      (nestag) ->
        nestag.browse { w:20, h:5 }


      "...and `browse({format:'array'})` returns an array as expected"
      3
      (nestag) ->
        nestag.browse({format:'array'}).length




"`config` usage"


"`config.w` and `config.h` can both be zero"
''
(nestag) ->
  nestag.browse({w:0, h:0})


"`config.w` is zero, returns a zero-width column"
'\n\n\n'
(nestag) ->
  nestag.browse({w:0, h:3})


"`config.h` is zero, returns an empty string"
''
(nestag) ->
  nestag.browse({w:3, h:0})


"A 1x1 box as expected"
'c'
(nestag) ->
  nestag.browse({w:1, h:1})


"A 1x2 box has no border"
'c\n '
(nestag) ->
  nestag.browse({w:1, h:2})


"A 7x1 box has no border"
'  abc  '
(nestag) ->
  nestag.browse({w:7, h:1})


"A 2x2 box as expected"
"bc\n''"
(nestag) ->
  nestag.browse({w:2, h:2})


"A 3x2 box as expected"
"abc\n'='"
(nestag) ->
  nestag.browse({w:3, h:2})


"A 2x5 box as expected"
"""
..
||
bc
||
''"""
(nestag) ->
  nestag.browse({w:2, h:5})


"A 4x4 box as expected"
"""
.--.
abc|
|  |
'=='"""
(nestag) ->
  nestag.browse({w:4, h:4})




      "`coord` exceptions"

      tudor.throw


      "coord must be valid"
      """
      /nestag/src/Nestag.litcoffee Nestag::browse()
        config.coord fails ^[a-z]{0,9999}$"""
      (nestag) -> nestag.browse { coord:'!' }


      "Must supply a coord which exists"
      """
      /nestag/src/Nestag.litcoffee Nestag::browse()
        coord 'x' does not exist"""
      (nestag) -> nestag.browse { coord:'x' }


      "For an empty Nestag instance, `browse()` throws an error..."
      """
      /nestag/src/Nestag.litcoffee Nestag::browse()
        coord '' does not exist"""
      -> (new Nestag).browse()


      "...and `browse({format:'array'})` also throws an error"
      """
      /nestag/src/Nestag.litcoffee Nestag::browse()
        coord '' does not exist"""
      -> (new Nestag).browse({format:'array'}).length





    ];


