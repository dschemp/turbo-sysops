Docker Container
================

## Docker
- Keep it clean.
- Utilize multi-stage building.


## Docker-Compose
- Stacks must have a self-contained, internal network that is not accessible (by default) from outside.
- All environment variables must be defined in the `.env` file.
- Ports must bind to `127.0.0.1` if a reverse proxy is available.
