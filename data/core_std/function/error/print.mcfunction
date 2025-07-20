#>core_std:error/print
#
# @authors scrmbl-egg
# @input
#   function: #[id="function"] string
#       Function that caused the error.
#   text: ::java::util::text::Text
#       Error message text component.

$tellraw @a [ \
    {text:"",color:"red"}, \
    {text:"[mc_std]: ",bold:true,color:"#3ad8cb"}, \
    {text:"ERROR: ",bold:true}, \
    {text:"In function '$(function)': "}, \
    $(text), \
]
