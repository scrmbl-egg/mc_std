#>core_std:load
#
# @authors scrmbl-egg, MARO-445

# init constants
function core_std:storage/init_consts

# init global variables if not defined
execute unless data storage std:main vars \
    run \
    function core_std:storage/init_vars

## __ KEEP AT BOTTOM OF FILE __
# reload message
execute if predicate core_std:should_show_message \
    run \
    tellraw @a [ \
    "", \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    "Reloaded!", \
    { \
        text:"\n   [GitHub wiki]", \
        color:"#d264d6", \
        hover_event:{action:"show_text",value:{text:"Go to the GitHub wiki page"}}, \
        click_event:{ \
            action:"open_url", \
            url:"https://github.com/scrmbl-egg/mc_std/wiki", \
        }, \
    }, \
    { \
        text:"\n   [GitHub issues]", \
        color:"red", \
        hover_event:{action:"show_text",value:{text:"Go to the GitHub issues page"}}, \
        click_event:{ \
            action:"open_url", \
            url:"https://github.com/scrmbl-egg/mc_std/issues", \
        }, \
    }, \
    { \
        text:"\n   [Quick introduction]", \
        hover_event:{ \
            action:"show_text", \
            value:{text:"Suggest command to the datapack's introductory book."}, \
        }, \
        click_event:{ \
            action:"suggest_command", \
            command:"/loot give @s loot std:quick_introduction_book", \
        }, \
        \
    }, \
    "\n   Reload message: ", \
    { \
        text:"[Enable]", \
        color:"green", \
        hover_event:{ \
            action:"show_text", \
            value:{text:"Suggest command which enables the datapack's reload message"}, \
        }, \
        click_event:{ \
            action:"suggest_command", \
            command:"/data modify storage std:main vars.show_reload_message set value true", \
        }, \
        \
    }, \
    " / ", \
    { \
        text:"[Disable]", \
        color:"red", \
        hover_event:{ \
            action:"show_text", \
            value:{text:"Suggest command which disables the datapack's reload message"}, \
        }, \
        click_event:{ \
            action:"suggest_command", \
            command:"/data modify storage std:main vars.show_reload_message set value false", \
        }, \
        \
    }, \
]
