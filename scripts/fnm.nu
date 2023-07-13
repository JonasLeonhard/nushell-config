# FNM PATH
if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  $env.PATH = ($env.PATH | prepend [
    $"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}
