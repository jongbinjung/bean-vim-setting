# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal Vim configuration, cloned to `~/.vim`. Plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug), which is auto-installed on first launch (see the bootstrap block at the top of `vimrc`).

## Common Commands (run inside Vim)

- `:PlugInstall` — install any plugins declared in `vimrc` that aren't yet on disk
- `:PlugUpdate` — update installed plugins
- `:PlugUpgrade` — upgrade vim-plug itself
- `:PlugClean` — remove plugins no longer declared in `vimrc`

YouCompleteMe is compiled via a `do:` hook in `vimrc` that runs `uv run python install.py --clang-completer --gocode-completer --rust-completer --java-completer --ts-completer`. If YCM breaks after a plugin update, re-run `:PlugUpdate` to trigger the hook, or run that command manually from `plugs/YouCompleteMe/`.

There is no build/test/lint step for this repo itself — changes are validated by reloading vim (`:source $MYVIMRC`) or restarting.

## Architecture

The entry point is **`vimrc`**. It is intentionally monolithic and organized with Vim fold markers (`{{{` / `}}}`) — every plugin block, key-remap block, and settings block is a fold. When editing, keep the fold structure intact and place new plugins inside the correct thematic section (Usability, File/text navigation, Visual, VCS, IDE, markup, Vanity).

Runtime layout follows standard Vim conventions:

- **`ftplugin/<ft>.vim`** — per-filetype buffer-local settings. These set `<LocalLeader>` (often `'`), tabstops, folding, ALE fixers, and slime/YCM bindings for that filetype. Prefer putting filetype-specific config here rather than in `vimrc`.
- **`plugs/`** — vim-plug install directory (git-ignored). Never commit; never edit files here directly.
- **`autoload/plug.vim`** — vim-plug itself (git-ignored, auto-installed).
- **`ultisnips/<ft>.snippets`** — UltiSnips snippet definitions. `g:UltiSnipsSnippetsDir` and `g:UltiSnipsSnippetDirectories` both point here (not the default `UltiSnips/`).
- **`skeletons/skeleton.<ext>`** — file templates auto-inserted for new files by `vim-skeletons` (`skeletons#autoRegister = 1`).
- **`spell/en.utf-8.add`** — personal spell-check dictionary (compiled `.spl` is git-ignored).
- **`plugin/`** — always-loaded vim scripts (currently just `window-killer.vim`).

## Conventions

- **Leader keys**: global `<Leader>` is `<Space>`. Many `ftplugin/` files set `<LocalLeader>` to `'`.
- **SQL dialect detection**: `ftplugin/sql.vim` parses the middle extension of `foo.sf.sql` / `foo.bq.sql` / etc. and passes `--dialect` to sqlfluff via `b:ale_sql_sqlfluff_options`. Aliases live in `s:sql_dialect_aliases` — extend that dict to add a new dialect. The `autocmd BufRead,BufNewFile *.sql.*` in `vimrc` ensures those files get `filetype=sql`.
- **Trailing whitespace**: stripped on every `BufWritePre` by `<SID>StripTrailingWhiteSpaces()` in `vimrc`.
- **Idempotent bootstrap**: the vim-plug install snippet at the top of `vimrc` uses `empty(glob(...))` before curling; preserve that pattern for any similar auto-install additions.
- **Python tooling**: uses `uv run` (not bare `python`) for pytest and script execution in `ftplugin/python.vim`. ALE fixers on save are enabled per-buffer via `b:ale_fix_on_save`.
