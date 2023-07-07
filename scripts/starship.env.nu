# .env - Starship prompt (starship.rs)
let-env STARSHIP_CONFIG = $env.HOME + '/.config/starship/starship.toml'
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
