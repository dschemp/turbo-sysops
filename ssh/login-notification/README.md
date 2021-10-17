# Notify on SSH logins

Based on the Telegram notification script from MikeWent (github.com/MikeWent/notify-send-telegram).

## Requirements
- an "Incoming Webhooks" url (from Mattermost, Discord, ...)
- `httpie`
- `gawk`
- `whois`
- `jq` (for the Mattermost version)

## Setup (normal)
Change the `WEBHOOK_URL` to your corresponding value.

Make sure `notify-login.sh` is executable.

Add the following line to `/etc/pam.d/sshd`:
```
session   optional  pam_exec.so type=open_session seteuid <PATH>
```
where `<PATH>` is the path to your `notify-login.sh` script.

## Setup (Mattermost)
Change the `WEBHOOK_URL` to your corresponding value and optionally `INTEGRATION_USERNAME`, `INTEGRATION_CHANNEL`, `INTEGRATION_COLOR` and `INTEGRATION_TEXT`.

Make sure `notify-login-mattermost.sh` is executable.

Add the following line to `/etc/pam.d/sshd`:
```
session   optional  pam_exec.so type=open_session seteuid <PATH>
```
where `<PATH>` is the path to your `notify-login-mattermost.sh` script.
