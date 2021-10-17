Caddy 2
=======

As I want to move away from nginx as my goto reverse proxy I want to move all the important configurations to Caddy 2.

###### And no Sefa, I am not doing Traefik .. for now at least

## Folder Structure
In the base path lays the Caddyfile.
`sites` contains service dependent config files.
`snippets` contains some snippets which can be imported.

```
/PATH/TO/CADDY/CONFIG
├── Caddyfile
├── sites
│   ├── ...
│   └── www
└── snippets
```

## systemd Service
For custom build versions of Caddy 2 there is no systemd-service provided by default (afaik).
Therefore Caddy provides a service file.
