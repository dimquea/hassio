# Add-on: Mobileraker companion

This addon is standalone variant of mobileracker companion. Allow you to connecting to multiple printers to recieve push notificatins.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Add-on have just one option. 

### Option: `printers`

The `printers` option describe all machines settings.

Option keys are:

- `name` name of printer (required)
- `moonraker_uri` url to printer moonraker api. For example `ws://192.168.0.2:7125/websocket` (required)
- `moonraker_api_key` api key, if force_logins or trusted clients is active (optional)

This option folow to original [configuration](https://github.com/Clon1998/mobileraker_companion?tab=readme-ov-file#configuration-file)

## Known issues and limitations

Not tested, almost.

## Authors & contributors

Author of original software [Clon1998](https://github.com/Clon1998/mobileraker_companion).

## License

MIT License

Copyright (c) 2021 Patrick Schmidt

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
