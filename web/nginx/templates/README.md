Templates
=========

Use tools like `sed` to replace `<SUBDOMAIN>` and `<DOMAIN>`.
Furthermore for redirects replace `<URL>` and for (local) reverse proxies `<PORT>`.

## Examples

Subdomain: `dash.board`

Domain: `example.com`

```
$ sed -in 's/<SUBDOMAIN>/dash.board/' <PATH_TO_CONFIG>
$ sed -in 's/<DOMAIN>/example.com/' <PATH_TO_CONFIG>
```

#### Redirect

For the tool `sed` you need to seperate the search and replace parameters with `+` when you use slashes.
```
$ sed -in 's+<URL>+https://dashboard.example.net+' <PATH_TO_CONFIG>
```

#### Local Reverse Proxy

```
$ sed -in 's/<PORT>/50423/' <PATH_TO_CONFIG>
```

#### General Reverse Proxy

In case you want to use the template for non-local reverse proxy stuff you will need to edit line 14 manually.

## Activate

You will need to put the config file into `/etc/nginx/sites-enabled` or whatever your path to active configurations is.
I recommend to store the files close to the services that need it and do a simple symbolic link.
