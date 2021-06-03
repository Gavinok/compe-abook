# compe-abook

Provides compe completion for email addresses in abook.

## Install

You also need to install [abook](https://abook.sourceforge.io/) and store some addresses in it.

### Using plug:

```vim
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'Gavinok/compe-abook'
```

### Using Packer:

```lua
return require("packer").startup(
 function(use)
 	use "hrsh7th/nvim-compe" --completion
 	use {'Gavinok/compe-abook', requires = 'nvim-lua/plenary.nvim', requires = 'hrsh7th/nvim-compe'}
 end
)
```

## Usage 

Make sure that compe-nvim is loaded.

```vim
let g:compe.source.abook = v:true
```

```clojure
((. (require :compe) :setup) 
 {:source 
   {:abook true})
```

```lua
require'compe'.setup {
  source = {
      abook = true
    }
}
```

## License

MIT
