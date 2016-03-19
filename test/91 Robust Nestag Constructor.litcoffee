91 Robust Nestag Constructor
============================

    if oo.ROBUSTABLE
      tudor.add [
        "91 Robust Nestag Constructor"
        tudor.is




        "Class members are immutable in modern UAs"

Prepare a test-instance. 

        -> [new Nestag]


        "Cannot add a property to the Nestag class"
        oo.U
        -> Nestag.nope = 123; Nestag.nope


        "Cannot add a property to the Nestag class’s prototype object"
        oo.U
        (nestag) -> Nestag::nope = 456; nestag.nope


        tudor.equal


        "`Nestag::C` is a constant"
        'Nestag'
        (nestag) -> nestag.C = 'changed!'; nestag.C



      ];

