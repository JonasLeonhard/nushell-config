# Aliases
alias rcd = cd
alias cat = bat
alias exa = exa --icons

def "lsg" [] {
  ls | sort-by type name -i | grid -c
}

# make autocomplete work with zoxide.
# alias cd = z does not work, as it is missing directory autocompletion
def-env "cd" [path?:directory] {
  if ($path | is-empty) {
    z
  } else {
    z ($path | str replace $"($env.PWD)/" "")
  }
}
