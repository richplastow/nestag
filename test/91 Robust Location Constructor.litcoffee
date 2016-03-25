91 Robust Location Constructor
==============================

    if oo.ROBUSTABLE
      tudor.add [
        "91 Robust Location Constructor"
        tudor.is




        "Class members are immutable in modern UAs"

Prepare a test-instance. 

        -> [new Location { nestag:new Nestag, coord:'a' }]


        "Cannot add a property to the Location class"
        oo.U
        -> Location.nope = 123; Location.nope


        "Cannot add a property to the Location class’s prototype object"
        oo.U
        (location) -> Location::nope = 456; location.nope


        tudor.equal


        "`Location::C` is a constant"
        'Location'
        (location) -> location.C = 'changed!'; location.C



      ];

