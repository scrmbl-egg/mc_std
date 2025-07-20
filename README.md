# `mc_std`
### A library of standard functions and abstractions for Minecraft datapacks.

## What is _mc_std_?
_mc_std_ is a datapack that provides functions and other abstractions that are meant to remove
overhead from datapack developers, by providing the ability to iterate over collections, do
mathematical functions, or check data types.

## How to use
One of the most important aspects of this datapack, is that functions that require parameters
will <ins>always</ins> require them via a storage, i.e. the user won't have to use the
`scoreboard` command, but rather, specify SNBT data when calling the function.

Here is an example of the usual syntax for a function call:
```mcfunction
function std:math/clamp { \
  min:5, \
  max:10, \
  value:20.222d, \
  out_storage:"custom:storage", \
  out_nbt:"clamped_result" \
}
```
The previous function call would generate the following data in the `custom:storage` storage:
```mcfunction
{clamped_result:10.0d}
```
This decision was made to allow for advanced features, give the user more control, and finally,
remove score objectives the user would need to keep track of to make use of the library's functions.

The use of this syntax also means with `function ... with storage ...` syntax is allowed as long
as the storage contains the appropriate keys for the function to work.

## Namespaces
_mc_std_ contains 3 namespaces:
- ✔️ `std`: This is the API, i.e. the namespace that contains the "public" and secure functions,
predicates, tags... etc, which the user is meant to use. 
- ✔️ `docs_std`: This is the documentation namespace, it has the same structure as the `std` namespace,
but the functions have no parameters, and just print the documentation of the function in the chat.
The user can add the `docs_` prefix to any `std` function name and get its documentation. 
- ❌ `core_std`: This is the core namespace, i.e. it contains the "private" and unsafe functions that the
public functions use internally. Since these functions are not documented and make unsafe macro
operations: **the use of these functions is <ins>not encouraged</ins>!** 

## Function modules
The `std` namespace has multiple function modules or directories, each designed for different purposes,
but before they are explained, here are the root functions, which are functions with no associated
directory:
- `std:empty`: Blank function, for functions that need commands as a parameter, but no operation is desired
by the user.
- `std:fail`: Used for early failure returns. Removes temporary data and kills temporary entities.
- `std:return_value`: Opposite of `std:fail`. Returns an integer value, removes temporary data and kills
temporary entities.
- `std:repeat`: Function that repeats a specific command a specified number of times.

Now, here's a quick overview of the function modules of the `std` namespace:
- `aabb/`: Functions for casting axis-aligned bounding boxes for precise collision detection.
- `array/`: Functions that operate with arrays or lists, includes the `std:array/foreach` function for
- `assert/`: Functions that check the type of a storage NBT path or location.
- `entity/`: Useful functions for entities.
- `math/`: Mathematical functions.
- `string/`: Functions for handling or generating strings.

## Other
Apart from functions, the `std` namespace also includes predicates and tags.

The available predicates consist of basic checks, like weather, lighting, input, or player state checks.

Lastly, the block and entity tags include empty tags, or tags that aren't covered by the vanilla/`minecraft`
namespace.

## Thank you for using the _mc_std_ datapack!
Remember that you can visit the [WIKI][wiki_link] or the [ISSUES][issues_link] page if you wish to find the
full documentation or report bugs or missing features.

# Special thanks
...to the contributors of the extensions and repositories that have made Minecraft 
coding tolerable:
- [language-mcfunction][language_repo] (R.I.P. [Arcensoth][arcensoth_gh])
- [syntax-mcfunction][syntax_repo]
- [SpyglassMC][spyglass_repo]

And the friend who has helped me in my Minecraft projects:
- [MARO-445][mariete_gh]

[wiki_link]: https://github.com/scrmbl-egg/mc_std/wiki
[issues_link]: https://github.com/scrmbl-egg/mc_std/issues
[language_repo]: https://github.com/Arcensoth/language-mcfunction
[arcensoth_gh]: https://github.com/Arcensoth
[syntax_repo]: https://github.com/MinecraftCommands/syntax-mcfunction
[spyglass_repo]: https://github.com/SpyglassMC/Spyglass
[mariete_gh]: https://github.com/MARO-445
