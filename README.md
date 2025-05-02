# smart-pane.yazi

Extend h and l to adjust preview size.

https://github.com/user-attachments/assets/ae259f4e-73ec-48f4-9b5e-217c56f80d0d

## Installation and Usage
Copy main.lua to `~/.config/yazi/plugins/smart-pane/main.lua`

Edit your `~/.config/yazi/keymap.toml` to change the mapping of your main left/right keys (default h and l).

```toml
[[manager.prepend_keymap]]
on   = "h"
run  = 'plugin smart-pane leave'
desc = "Run smart-pane leave"
```

```toml
[[manager.prepend_keymap]]
on   = "l"
run  = 'plugin smart-pane enter'
desc = "Run smart-pane enter"
```

Shoutout to [sxyazi](https://github.com/sxyazi) for creating toggle-pane, which I basically copied for this plugin.

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.

[open]: https://yazi-rs.github.io/docs/configuration/keymap/#manager.open
[enter]: https://yazi-rs.github.io/docs/configuration/keymap/#manager.enter
