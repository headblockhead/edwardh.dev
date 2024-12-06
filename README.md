# edwardh.dev

Very much under construction. Come back later?

## Tasks

### live

```bash
watch -n 1 "bash -c \"rm -r .zas/deploy/* && ~/go/bin/zas\""
```

### server
directory: ./.zas/deploy

```bash
nix run nixpkgs#python39 -- -m http.server 8080
```
