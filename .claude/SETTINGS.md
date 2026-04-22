# Claude Code settings

Documentation for `.claude/settings.json`. JSON itself has no comment syntax, so notes live here.

## `enabledPlugins`

Map of `<plugin>@<marketplace>` → `true|false`. Plugins ship skills, slash commands, hooks, and MCP servers; only those listed `true` are loaded.

- `slds-lecture-skills@wintermute` — lecture-slide review skills (LaTeX/R/PDF lint) from the SLDS group's `wintermute` marketplace.
- `slds-paper-skills@wintermute` — paper-writing skills (literature search, context anchors).
- `skill-creator@claude-plugins-official` — Anthropic's official skill-authoring helper. Used to create/edit/eval custom skills.

## `extraKnownMarketplaces`

Registers plugin marketplaces beyond the built-in defaults. Each entry pairs a name with a source spec.

- `wintermute` — the SLDS plugin marketplace, fetched over SSH from `git@github.com:slds-lmu/wintermute.git`. `autoUpdate: true` means Claude Code refreshes the marketplace on its own; set to `false` to pin and update manually.

## `effortLevel`

Reasoning depth Claude applies before responding. `"high"` = more thinking time per turn. Other values: `"low"`, `"medium"`. Higher = better answers on hard problems, slower and more tokens.

## `voiceEnabled`

`true` enables voice input in the CLI.

## `statusLine`

Custom status bar shown above the prompt. `type: "command"` runs an external program; Claude Code pipes a JSON blob (model, workspace, cost, context window, …) to its stdin and uses the first line of stdout as the status line.

- `command` — points to the script in this repo: `bash /home/bischl/cos/dotfiles/.claude/statusline-command.sh`. Edit that script to change what's displayed.
