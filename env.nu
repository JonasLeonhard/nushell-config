# Nushell Environment Config File version = 0.82.0

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
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
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# Configuration
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.NVIM_DEV_PATH = "~/Documents/Git"

# Bun
$env.BUN_INSTALL = $"($env.HOME)/.bun"

# Pnpm
$env.PNPM_HOME = $"($env.HOME)/.local/share/pnpm"

$env.PATH = (
    $env.PATH
        | split row (char esep)
        | append "/home/linuxbrew/.linuxbrew/bin" # linux
        | append "/opt/homebrew/bin" # macos
        | append "/usr/bin"
        | append "/usr/local/bin"
        | append "/usr/local/go/bin"
        | append "/usr/local/sbin"
        | append "/opt/local/bin"
        | append "/usr/sbin"
        | append $"($env.BUN_INSTALL)/bin"
        | append $"($env.HOME)/.cargo/bin"
        | append $"($env.HOME)/.composer/vendor/bin"
        | append $"($env.HOME)/.dvm"
        | append $"($env.HOME)/.local/share/pnpm" # linux
        | append $"($env.HOME)/.yarn/bin"
        | append $"($env.HOME)/Library/pnpm" # macos
        | append $"($env.HOME)/go/bin"
        | append $"($env.HOME)/Library/Python/3.9/bin"
        | append $env.PNPM_HOME
        | uniq
)

# .env - Starship prompt (starship.rs)
$env.STARSHIP_CONFIG = $"($env.HOME)/.config/starship/starship.toml"
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# .env - Zoxide (https://github.com/ajeetdsouza/zoxide)
# install via cargo install --git https://github.com/ajeetdsouza/zoxide - the brew or cargo install version has a old version of the init.nu script
# mkdir ~/.cache/zoxide
# zoxide init nushell | save -f ~/.cache/zoxide/init.nu
