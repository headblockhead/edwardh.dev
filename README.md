# [edwardh.dev](https://edwardh.dev)

A handwriten HTML and CSS site to showcase my projects and achievements.

Uses [Zas](https://github.com/darccio/zas) to template-in the header, footer, and meta tags (title, description, CSS).

Features a custom made SVG icon made in the GNOME appicon style, and uses GNOME theme colours.

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
