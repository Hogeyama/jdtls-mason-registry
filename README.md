# jdtls-mason-registry

This is a [mason](https://github.com/williamboman/mason.nvim) registry that provides only older versions of jdtls.
I created this registry because the latest versions of jdtls often become unstable or stop working in my environment.

## Usage

```lua
{
  'williamboman/mason.nvim',
  opts = {
    registries = {
      'github:Hogeyama/jdtls-mason-registry',
      'github:mason-org/mason-registry',
    },
  },
}
```

Then run `:MasonInstall jdtls`.
