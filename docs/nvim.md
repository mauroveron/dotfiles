# Neovim config

## Features

### Autocompletion

I use the following plugins:
- vim-cmp


## Language servers

### Pyright

```
npm install -g pyright
```

### typescript

```
npm install -g typescript-language-server
`

### elixirls

```
git clone git@github.com:elixir-lsp/elixir-ls.git ~/.local/elixir-ls
cd ~/.local/elixir-ls
mix deps.get
mix compile
mix elixir_ls.release
```

The language server is then at `~/.local/elixir-ls/release/language_server.sh`
