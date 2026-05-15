# smart-pane.yazi

Extend h and l to adjust preview size.

https://github.com/user-attachments/assets/ae259f4e-73ec-48f4-9b5e-217c56f80d0d

Pressing `l` on a file progressively hides the parent panel, then the current panel, maximizing the preview. Pressing `h` restores them. Pressing `l` on a directory enters it as normal.

## Installation

```sh
ya pkg add tpsteiner/smart-pane
```

## Usage

Add to your `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on  = "h"
run = "plugin smart-pane leave"
desc = "Smart leave"

[[mgr.prepend_keymap]]
on  = "l"
run = "plugin smart-pane enter"
desc = "Smart enter"
```

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.

Shoutout to [sxyazi](https://github.com/sxyazi) for creating toggle-pane, which this plugin is based on.
