# Aliases
alias rcd = cd
alias cdi = zi
alias cat = bat
alias exa = exa --icons
alias explore = explore --peek
alias rm = rm --trash
alias cd = z

def "lsg" [] {
  ls | sort-by type name -i | grid -c
}
