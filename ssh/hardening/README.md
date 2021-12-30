# OpenSSH Server Hardening

This follows closely the Telekom IT Security Recommendations for OpenSSH servers. [Link to their repo](https://github.com/telekom/tel-it-security-automation)

## Installation

It is important that you have setup a non-root user with a public key for this as this will remove the ability to login as root and enable only public key authentication!
Your key should go into the standard `authorized_keys` path of your user (most likely into `/home/<USER>/.ssh/authorized_keys`).

1. Download the `change_moduli.sh`.
2. Make it executable: `chmod +x change_moduli.sh`.
3. Execute it with elevated / root rights: `sudo ./change_moduli.sh`.
4. Download the `sshd_config`.
5. Backup your old `sshd_config`: e. g. `sudo mv /etc/ssh/sshd_config{,.bak}`
6. Move the download SSH config to `/etc/ssh/sshd_config`.
7. Restart the OpenSSH server.

If everything went well you should stay connected and can still connect to your server with a non-root user.
