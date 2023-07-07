# The prompt indicators are environmental variables that represent
# the state of the prompt

let-env PROMPT_INDICATOR = { || "$" }
let-env PROMPT_INDICATOR_VI_INSERT = {|| "" }
let-env PROMPT_INDICATOR_VI_NORMAL = {|| "" }
let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }
