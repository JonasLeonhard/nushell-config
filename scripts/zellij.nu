# Zellij auto attach
$env.ZELLIJ_CONFIG_DIR = $"($env.HOME)/.config/zellij"
if not ("ZELLIJ" in $env) {
  zellij attach -c "main"
}
