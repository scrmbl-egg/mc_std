#>std.core:out/print_warning
#
# Prints a warning message in the chat.
#
# @authors scrmbl-egg
# @input
#   function: #[id="function"] string
#       Function that caused the warning.
#   text: ::java::util::text::Text
#       Warning message text component.

$tellraw @a [ \
    {text:"",color:"gold"}, \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"WARNING: ",bold:true}, \
    {text:"In function '$(function)': "}, \
    $(text), \
]
