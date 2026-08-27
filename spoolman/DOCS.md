# Add-on: Spoolman

Spoolman is a self-hosted web service designed to help you efficiently manage your 3D printer filament spools and monitor their usage.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Add-on have some options, that uses as Spoolman [env](https://github.com/Donkie/Spoolman/blob/master/.env.example) options.

Backup you spoolman.db before any updates.

## Ingress and direct port access

**The Home Assistant panel (Ingress).** Spoolman appears in the sidebar and under _Open
Web UI_ on the add-on page. Traffic goes through Home Assistant, so Home Assistant's own
login is the only way in. This way the spoolman admin panel is conveniantly reachable 
wherever your Home Assistant is reachable.

**Port 7912.** Moonraker, OctoPrint, scripts and anything else that is not a
browser talk to Spoolman at `http://<your-home-assistant>:7912`. These clients cannot use
the panel: its URL contains a token Home Assistant generates and can change, and it
requires a Home Assistant session. Moonraker's `[spoolman] server:` setting therefore
keeps pointing at port 7912 and needs no change.

Ingress notes:

- If you have set `allowed_hosts`, it applies to the panel too. Reaching Home Assistant
  on a real domain name (a Nabu Casa `*.ui.nabu.casa` address, or your own domain) means that
  hostname must be listed there, or every request through the panel is refused with a
  `400`. Local addresses (`homeassistant.local`, an IP) are always allowed and need no
  entry.
- `legacy_client: true` is not supported through the panel. Use port 7912 instead.
- `base_path` disables the panel. Ingress supplies its own prefix, so the two cannot be
  combined. Leave `base_path` unset unless you are also putting Spoolman behind your own
  reverse proxy on a sub-path.

### Option: `log_level`

The `log_level` option controls the level of log output by the Spoolman itself.

Possible values are:

- `DEBUG`
- `INFO`
- `WARNING`
- `ERROR`
- `CRITICAL`

Logs will only be reported if the level is higher than the level set here.

Default if not set: `INFO`

### Option: `auto_backup`

Automatic nightly backup for SQLite databases.

### Option: `base_path`

Set this if you want to host Spoolman at a sub-path.

For example: if you want the root to be e.g. `myhost.com/spoolman`, set this to `/spoolman`.

### Option: `debug_mode`

If enabled, the client will accept requests from any host. This can be useful when developing, but is also a security risk.

### Option: `legacy_client`

Mirror of internal `SPOOLMAN_LEGACY_CLIENT` env, introdused in [0.26.0](https://github.com/Donkie/Spoolman/releases/tag/v0.26.0). 

If enabled, will be used legacy frontend client.

### Option: `cors_origin`

Mirror of internal `SPOOLMAN_CORS_ORIGIN` env, hardened in [0.26.0](https://github.com/Donkie/Spoolman/releases/tag/v0.26.0).

Extra browser origins allowed to talk to Spoolman. Since 0.26.0 Spoolman refuses cross-origin
writes (`POST`/`PUT`/`PATCH`/`DELETE`) and websocket connections with a `403`:

> Request refused: it came from an origin this Spoolman instance does not trust.

You only need this when a web UI served from a *different* address talks to Spoolman, such as a
Fluidd or Mainsail instance on another host, or a custom Home Assistant dashboard card. Spoolman's
own web UI does not need it, and neither does Moonraker, OctoPrint or any Home Assistant
integration.

Add one entry per origin. **Each entry must include the scheme** — a bare `host:port` is not an
origin and will never match.

For example:

- `https://fluidd.local`
- `http://homeassistant.local:8123`

A single entry of `*` allows every origin. Be aware that this turns the origin checks off
entirely, so any website you visit can read and modify your Spoolman data in the background. Only
do this on a trusted network.

Default if not set: same-origin only.

### Option: `allowed_hosts`

Mirror of internal `SPOOLMAN_ALLOWED_HOSTS` env, introduced in [0.26.0](https://github.com/Donkie/Spoolman/releases/tag/v0.26.0).

Hostnames this Spoolman instance answers to. Protects against DNS rebinding, where a domain an
attacker owns is pointed at your Spoolman's local address so that their web page can talk to it.

These are **hostnames, not origins: no scheme, no port**. `*.mydomain.com` covers the domain and
its subdomains.

The following keep working without being listed: IP addresses, single-word names, `.local`,
`.localhost`, `.lan`, `.home`, `.home.arpa` and `.internal` names, and any hostname already
present in `cors_origin`.

If you reach Spoolman through a reverse proxy on a real domain, that domain must be listed here
once this option is set, or every request is refused with a `400`:

> Request refused: it was addressed to a hostname this Spoolman instance does not answer to.

Default if not set: off (host checking is disabled entirely).

## Backup and restore

Add-on store files to own directory in `addon_configs`.

You can backup database by downloading `spoolman.db` stored there.

To restore database, stop add-on, then replace `spoolman.db` with another one.

## Known issues and limitations

Refreshing the browser while you are on a spool's detail page inside the Home Assistant
panel shows a blank page. Go back through the sidebar. Detail pages are the one route
Spoolman serves from its single-page-app fallback document, and that document uses
absolute asset paths, which the panel's URL prefix breaks. Reaching a spool by clicking
it in the list works normally.

A browser that loads Spoolman inside a _sandboxed_ iframe sends `Origin: null`, which
Spoolman never trusts, and no `cors_origin` entry can help. This does not affect the Home
Assistant panel — that iframe allows same-origin access, so the browser sends Home
Assistant's real origin. It only bites custom dashboards that embed Spoolman in an iframe
of their own. The ways around it there are `cors_origin: ["*"]` or `debug_mode`.

You tell me.

## Authors & contributors

Author of original software [Donkie](https://github.com/Donkie/Spoolman).

## License

MIT License

Copyright (c) 2023 Daniel Hultgren

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
