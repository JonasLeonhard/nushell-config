# env - PATH
# Brew PATH
let-env PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

# Composer PATH
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME + '/.composer/vendor/bin'))

# Composer PATH
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME + '/.composer/vendor/bin'))

# Dvm PATH
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME + '/.dvm'))

# local bin PATH
let-env PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin')
let-env PATH = ($env.PATH | split row (char esep) | prepend '/usr/bin')
let-env PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/sbin')
let-env PATH = ($env.PATH | split row (char esep) | prepend '/usr/sbin')

# cargo bin
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME + '/.cargo/bin'))
