## Ryan's Sublime Text Setup

### TODO:

Find a way to automate this shiz...

#### Sublime CLI

This gets added by the brew cask automatically, sweet.


### Package Control

Grab the current installation code from [Package Control Site](https://packagecontrol.io/installation)


## Packages

* [AdvancedNewFile](https://packagecontrol.io/packages/AdvancedNewFile)
* [Alignment](https://packagecontrol.io/packages/Alignment)
* [BracketHighlighter](https://packagecontrol.io/packages/BracketHighlighter)
* [CSSTidy](https://packagecontrol.io/packages/CSSTidy)
* [DocBlockr](https://packagecontrol.io/packages/DocBlockr)
* [Dotfiles Syntax Highlighting](https://packagecontrol.io/packages/Dotfiles%20Syntax%20Highlighting)
* [Gist](https://packagecontrol.io/packages/Gist)
* [Git](https://packagecontrol.io/packages/Git)
* [GitGutter](https://packagecontrol.io/packages/GitGutter)
* [SCSS](https://packagecontrol.io/packages/SCSS)
* [SideBarEnhancements](https://packagecontrol.io/packages/SideBarEnhancements)
* [SublimeLinter](https://packagecontrol.io/packages/SublimeLinter)
* [TrailingSpaces](https://packagecontrol.io/packages/TrailingSpaces)
* [WordPress Developer Resources](https://packagecontrol.io/packages/WordPress%20Developer%20Resources)


## Theme

Currently, [cobalt2](https://github.com/wesbos/cobalt2)

User prefs. for this theme are:

```bash
"color_scheme": "Packages/Theme - Cobalt2/cobalt2.tmTheme",
"theme": "Cobalt2.sublime-theme",
```

## Settings

**Sublime Text > Preferences > Settings - User**

```json
{
	"color_scheme": "Packages/Theme - Cobalt2/cobalt2.tmTheme",
	"theme": "Cobalt2.sublime-theme",
	"drag_text": false,
	"ensure_newline_at_eof_on_save": true,
	"folder_exclude_patterns":
	[
		".sass-cache"
	],
	"font_face": "SourceCodePro",
	"font_options":
	[
		"no_bold",
		"subpixel_antialias"
	],
	"font_size": 17,
	"highlight_line": true,
	"highlight_modified_tabs": true,
	"ignored_packages":
	[
		"Vintage"
	],
	"indent_guide_options":
	[
		"draw_normal"
	],
	"line_padding_bottom": 1,
	"line_padding_top": 1,
	"scroll_past_end": true,
	"tab_size": 2,
	"trim_trailing_white_space_on_save": true,
	"word_wrap": "true"
}
```

## Key Bindings

```json
[
	{ "keys": ["super+n"], "command": "new_window" },
	{ "keys": ["super+t"], "command": "new_file" }
]

```

