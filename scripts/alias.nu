# Aliases
alias cat = bat
alias cd = z
alias exa = exa --icons

def "lsg" [] {
  ls | sort-by type name -i | grid -c
}
