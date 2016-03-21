93 Robust Location methods
==========================

    if oo.ROBUSTABLE
      tudor.add [
        "93 Robust Location methods"
        tudor.is




        "`browse()` is immutable"

Prepare a test-instance. 

        -> [new Location { nestag:new Nestag, coord:'a' }]


        "`browse()` is not writable"
        oo.F
        (location) ->
          location.browse = 123
          location.browse


        "`browse()` is not configurable"
        oo.F
        (location) ->
          try
            Object.defineProperty location, 'browse', { writable:true }
          catch e
          location.browse = 'nope'
          location.browse


        "`browse()` cannot be replaced by another method using `prototype`"
        oo.S
        ->
          Location::browse = -> false
          (new Location { nestag:new Nestag, coord:'a'}).browse() # `new Location` in case `browse='nope'` succeeded


        "`browse()` cannot be replaced by another method using direct-access"
        oo.S
        (location) ->
          location.browse = -> []
          location.browse()



      ];

