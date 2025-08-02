# Input:
# in_storage - storage where the dividend is stored
# in_path - storage NBT path where the dividend is stored
# out_storage - storage where the result will be stored
# out_path - storage NBT path where the result will be stored
# divisor - the number by which to divide


# scale up
$function std:math/scale {in_storage:"$(in_storage)", in_path:"$(in_path)", out_storage:"std:temp", out_path:"divide.scaler", factor:2, up:1}

# divide
$execute store result storage $(out_storage) $(out_path) double $(divisor) run data get storage std:temp divide.scaler

# scale down
$function std:math/scale {in_storage:"$(out_storage)", in_path:"$(out_path)", out_storage:"$(out_storage)", out_path:"$(out_path)", factor:2, up:0}
