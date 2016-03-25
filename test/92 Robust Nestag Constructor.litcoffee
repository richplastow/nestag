92 Robust Nestag Constructor
============================

    if oo.ROBUSTABLE
      tudor.add [
        "92 Robust Nestag Constructor"
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


        "`Nestag::grid` cannot be changed after instantiation"
        '3x3x3'
        ->
          n = new Nestag { grid:[3,3,3] }
          n.grid[1] = 50; n.grid.join 'x'


        "`Nestag::grid` elements cannot be changed after instantiation"
        '100'
        ->
          n = new Nestag { grid:[100] }
          n.grid = 'nope'; n.grid.join 'x'


        "`Nestag::nest` cannot be changed after instantiation"
        123
        ->
          n = new Nestag { nest:123 }
          n.nest = 456; n.nest


        "`Nestag::scheme` cannot be changed after instantiation"
        'dimensional'
        ->
          n = new Nestag { scheme:'dimensional' }
          n.scheme = 'continuous'; n.scheme


        "`Nestag::form` cannot be changed after instantiation"
        'long'
        ->
          n = new Nestag { form:'long' }
          n.form = 'short'; n.form




      ];

