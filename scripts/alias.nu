# Aliases
alias cat = bat
alias exa = exa --icons
alias cd = z

def "lsg" [] {
  ls | sort-by type name -i | grid -c
}
