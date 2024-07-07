# Nushell Config File
#
# version = 0.90.2

use theme.nu

# carapace completions: (https://github.com/rsteube/carapace-bin)
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

# The default config record. This is where much of your global configuration is setup.
$env.config = {
  # true or false to enable or disable the welcome banner at startup
  show_banner: false
  ls: {
    use_ls_colors: true # use the LS_COLORS environment variable to colorize output
    clickable_links: true # enable or disable clickable links. Your terminal has to support links.
  }
  rm: {
    always_trash: true # always act as if -t was given. Can be overridden with -p
  }
  table: {
    mode: light # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: auto # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    show_empty: true # show 'empty list' and 'empty record' placeholders for command output
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "…" # A suffix used by the 'truncating' methodology
    }
  }

  # datetime_format determines what a datetime rendered in the shell would look like.
  # Behavior without this configuration point will be to "humanize" the datetime display,
  # showing something like "a day ago."

  datetime_format: {
    normal: '%a, %d %b %Y %H:%M:%S %z'  # shows up in displays of variables or other datetime's outside of tables
    # table: '%m/%d/%y %I:%M:%S%p'        # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
  }

  explore: {
    help_banner: true
    exit_esc: true

    # command_bar_text: '#C4C9C6'
    # command_bar: {fg: '#C4C9C6' bg: '#223311' }

    # status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6' }
    # status_bar_text: {fg: '#C4C9C6' bg: '#223311' }

    # highlight: {bg: 'yellow' fg: 'black' }

    status: {
      # warn: {bg: 'yellow', fg: 'blue'}
      # error: {bg: 'yellow', fg: 'blue'}
      # info: {bg: 'yellow', fg: 'blue'}
    }

    try: {
      # border_color: 'red'
      # highlighted_color: 'blue'

      # reactive: false
    }

    table: {
      # split_line: '#404040'

      cursor: true

      line_index: true
      line_shift: true
      line_head_top: true
      line_head_bottom: true

      show_head: true
      show_index: true

      # selected_cell: {fg: 'white', bg: '#777777'}
      # selected_row: {fg: 'yellow', bg: '#C1C2A3'}
      # selected_column: blue

      # padding_column_right: 2
      # padding_column_left: 2

      # padding_index_left: 2
      # padding_index_right: 1
    }

    config: {
      # cursor_color: {bg: 'yellow' fg: 'black' }

      # border_color: white
      # list_color: green
    }
  }

  history: {
    max_size: 100_000 # Session has to be reloaded for this to take effect
    sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "sqlite" # "sqlite" or "plaintext"
    isolation: false # true enables history isolation, false disables it. true will allow the history to be isolated to the current session. false will allow the history to be shared across all sessions.
  }
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true  # set this to false to prevent auto-selecting completions when only one remains
    partial: true  # set this to false to prevent partial filling of the prompt
    algorithm: "fuzzy"  # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: $carapace_completer # check 'carapace_completer' above as an example
    }
  }
  filesize: {
    metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
  }
  cursor_shape: {
    emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line (line is the default)
    vi_insert: line # block, underscore, line , blink_block, blink_underscore, blink_line (block is the default)
    vi_normal: block # block, underscore, line, blink_block, blink_underscore, blink_line (underscore is the default)
  }
  color_config: (theme)
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  # buffer_editor: "nvim" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  use_ansi_coloring: true
  bracketed_paste: true # enable bracketed paste, currently useless on windows
  edit_mode: vi # emacs, vi
  shell_integration: {
    # osc2 abbreviates the path if in the home_dir, sets the tab/window title, shows the running command in the tab/window title
    osc2: true
    # osc7 is a way to communicate the path to the terminal, this is helpful for spawning new tabs in the same directory
    osc7: true
    # osc8 is also implemented as the deprecated setting ls.show_clickable_links, it shows clickable links in ls output if your terminal supports it
    osc8: true
    # osc9_9 is from ConEmu and is starting to get wider support. It's similar to osc7 in that it communicates the path to the terminal
    osc9_9: false
    # osc133 is several escapes invented by Final Term which include the supported ones below.
    # 133;A - Mark prompt start
    # 133;B - Mark prompt end
    # 133;C - Mark pre-execution
    # 133;D;exit - Mark execution finished with exit code
    # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
    osc133: true
    # osc633 is closely related to osc133 but only exists in visual studio code (vscode) and supports their shell integration features
    # 633;A - Mark prompt start
    # 633;B - Mark prompt end
    # 633;C - Mark pre-execution
    # 633;D;exit - Mark execution finished with exit code
    # 633;E - NOT IMPLEMENTED - Explicitly set the command line with an optional nonce
    # 633;P;Cwd=<path> - Mark the current working directory and communicate it to the terminal
    # and also helps with the run recent menu in vscode
    osc633: true
    # reset_application_mode is escape \x1b[?1l and was added to help ssh work better
    reset_application_mode: true
  }
  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.

  hooks: {
    pre_prompt: [{||
      null  # replace with source code to run before the prompt is shown
    }]
    pre_execution: [{||
      null  # replace with source code to run before the repl input is run
    }]
    env_change: {
      PWD: [{ |before, after|
        null
      }]
    }
    display_output: {||
      if (term size).columns >= 100 { table -e } else { table }
    }
    command_not_found: {||
      null  # replace with source code to return an error message when a command is not found
    }
  }
  menus: [
      # Configuration for default nushell menus
      # Note the lack of source parameter
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "󰋼 "
        type: {
            layout: columnar
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: ide_completion_menu
        only_buffer_difference: false
        marker: "󰋼 "
        type: {
            layout: ide
            min_completion_width: 0,
            max_completion_width: 50,
            # max_completion_height: 10, # will be limited by the available lines in the terminal
            padding: 0,
            border: false,
            cursor_offset: 0,
            description_mode: "prefer_right"
            min_description_width: 0
            max_description_width: 50
            max_description_height: 10
            description_offset: 1
            # If true, the cursor pos will be corrected, so the suggestions match up with the typed text
            #
            # C:\> str
            #      str join
            #      str trim
            #      str split
            correct_cursor_pos: false
        }
        style: {
            text: blue
            selected_text: {attr: r}
            description_text: yellow
            match_text: {attr: u}
            selected_match_text: {attr: ur}
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "󱦟 "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "󰞋 "
        type: {
            layout: description
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      # Example of extra menus created using a nushell source
      # Use the source field to create a list of records that populates
      # the menu
      {
        name: commands_menu
        only_buffer_difference: false
        marker: " "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            scope commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: " "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            scope variables
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "󰞋 "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            scope commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
      {
        name: zoxide_menu
        only_buffer_difference: true
        marker: "| "
        type: {
            layout: columnar
            page_size: 20
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            zoxide query -ls $buffer
            | parse -r '(?P<description>[0-9]+) (?P<value>.+)'
        }
      }
  ]
  keybindings: [
    {
      name: completion_menu
      modifier: control
      keycode: char_n
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: ide_completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
          until: [
              { send: menu name: ide_completion_menu }
              { send: menunext }
              { edit: complete }
          ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
      event: { send: menuprevious }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: emacs
      event: { send: menu name: history_menu }
    }
    {
      name: next_page
      modifier: control
      keycode: char_x
      mode: emacs
      event: { send: menupagenext }
    }
    {
      name: undo_or_previous_page
      modifier: control
      keycode: char_z
      mode: emacs
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
       }
    }
    {
      name: yank
      modifier: none
      keycode: char_y
      mode: emacs
      event: {
        until: [
          {edit: pastecutbufferafter}
        ]
      }
    }
    {
      name: commands_menu
      modifier: control
      keycode: char_t
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_menu }
    }
    {
      name: vars_menu
      modifier: none # workaround for alt-v
      keycode: char_√
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: vars_menu }
    }
    {
      name: commands_with_description
      modifier: none # workaround for alt-d
      keycode: char_∂
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_with_description }
    },
    # Custom Keybindings
    {
      name: fzf_zellija
      modifier: none
      keycode: char_ø # workaround for alt-e
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand,
        cmd: "zellija"
      }
    }
    {
      name: accept_history_hint_completion
      modifier: control
      keycode: char_l
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: HistoryHintComplete,
      }
    }
    {
      name: menu_up
      modifier: none
      keycode: char_∆ # workaround for alt-k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: MenuUp,
      }
    }
    {
      name: menu_down
      modifier: none
      keycode: char_º # workaround for alt-j
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: MenuDown,
      }
    }
    {
      name: history_down
      modifier: control
      keycode: char_j
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: PreviousHistory,
      }
    }
    {
      name: history_down
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: NextHistory,
      }
    }
    {
      name: clear_screen
      modifier: control
      keycode: char_h
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand,
        cmd: "clear"
      }
    }
    {
      name: gitui
      modifier: control
      keycode: char_g # workaround for alt-e
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand,
        cmd: "gitui"
      }
    }
    {
      name: zoxide_menu
      modifier: control
      keycode: char_z
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: zoxide_menu }
    },
  ]
}

source commands.nu
source parallel.nu
source prompt_indicator.nu
source secrets.nu # Create a empty one with: touch ([($nu.default-config-dir), 'scripts', 'secrets.nu'] | str join '/') , contains private env vars etc.
source zellij.nu

# These sources are build in env.nu!
source ~/.cache/mise/init.nu
source ~/.cache/starship/init.nu
source ~/.cache/zoxide/init.nu


# !must be called after init of all plugins. Eg. zoxide init!
source alias.nu
