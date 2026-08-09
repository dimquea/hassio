# Add-on: Spoolman

Spoolman is a self-hosted web service designed to help you efficiently manage your 3D printer filament spools and monitor their usage.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Add-on have some options, that uses as Spoolman [env](https://github.com/Donkie/Spoolman/blob/master/.env.example) options.

Backup you spoolman.db before any updates.

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

## Backup and restore

Add-on store files to own directory in `addon_configs`.

You can backup database by downloading `spoolman.db` stored there.

To restore database, stop add-on, then replace `spoolman.db` with another one.

## Known issues and limitations

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
