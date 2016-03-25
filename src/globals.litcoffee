globals
=======

@todo describe in detail


#### A global tag lookup-object, shared by all Nestag and Location instances

    global_tags = [
      'strict' # reserved tag, always at index 0
      'skip'   # reserved tag, always at index 1
    ]
    global_tags.strict = 0
    global_tags.skip   = 1




#### `TAG_RULE <string>`
Used for validating `tags` arguments. 

    TAG_RULE = '^[a-z]\\w{1,23}$'


#### `COORD_RULE <string>`
Used for validating `coord` arguments. 

    COORD_RULE = '^[a-z]{0,999999}$'




    ;
