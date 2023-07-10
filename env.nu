# Nushell Environment Config File version = 0.82.0

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# Configuration
let-env EDITOR = "nvim"
let-env VISUAL = "nvim"
let-env PNPM_HOME = $"($env.HOME)/Library/pnpm"

$env.PATH = (
    $env.PATH
        | split row (char esep)
        | append "/usr/bin"
        | append "/usr/sbin"
        | append "/usr/local/bin"
        | append "/usr/local/sbin"
        | append "/opt/homebrew/bin"
        | append $"($env.HOME)/.cargo/bin"
        | append $"($env.HOME)/.composer/vendor/bin"
        | append $"($env.HOME)/.dvm"
        | append $env.PNPM_HOME
        | uniq
)

# carapace completions: (https://github.com/rsteube/carapace-bin)
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

# .env - Starship prompt (starship.rs)
let-env STARSHIP_CONFIG = $env.HOME + '/.config/starship/starship.toml'
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# .env - Zoxide (https://github.com/ajeetdsouza/zoxide)
zoxide init nushell | save -f ~/.zoxide.nu
