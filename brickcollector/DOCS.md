# Home Assistant Add-on: BrickCollector

A LEGO collection manager — sets, minifigures and parts, with the BrickLink
catalogue inside it. Opens as a panel in the Home Assistant sidebar.

## Installation

1. Add the add-on repository in **Settings → Add-ons → Add-on store → ⋮ →
   Repositories**.
2. Find **BrickCollector** and click **Install**.
3. Start the add-on and watch the log: on its first start it downloads the
   BrickLink catalogue, about 38 MB, and unpacks it into the database. That is
   175 thousand items and a million and a half inventory rows — on a Raspberry
   Pi it takes several minutes. The panel appears in the sidebar once it is
   done.
4. Open **BrickCollector** in the sidebar.

## Access

The add-on is reachable **through the Home Assistant panel only**. No port is
published, and that is deliberate: the application has no authentication of its
own, so the one door in is the one Home Assistant guards. Whoever can open the
panel can open the collection.

If you need it from outside, the answer is not to publish a port but to set up
external access to Home Assistant itself.

## Configuration

```yaml
locale: ru
currency: RUB
log_level: warning
import_catalog: true
fetch_images: true
fetch_batch: 200
fetch_interval: 300
catalog_url: https://github.com/rgriebl/brickstore-database/releases/latest/download/downloads.zip
```

### `locale`

Interface language, `en` or `ru`. It can also be switched inside the
application, under Settings; this only decides where a fresh installation
starts.

### `currency`

Three-letter code the amounts are shown in. It does not affect storage: money
is always kept as whole minor units. Changeable inside the application too.

### `log_level`

How much to write to the log: `debug`, `info`, `notice`, `warning`, `error`,
`fatal`. On `debug` and `trace` the application also shows error details in the
browser, which is not how you want to run it day to day.

### `import_catalog`

Download and unpack the BrickLink catalogue at startup if it is not there yet.
Turn it off if you would rather put `downloads.zip` in the add-on folder
yourself.

Once the add-on is running, the usual way to refresh the catalogue is
**Settings → Catalogue** inside the application.

### `fetch_images`, `fetch_batch`, `fetch_interval`

Whether to cache pictures of the items you own, and in what batches. Showing a
picture does not depend on this: anything not cached is loaded straight from
BrickLink. The cache is what keeps a collection's pictures when the source will
not answer.

The catalogue is not cached at all — it holds 175 thousand items. A collection
of ordinary size is a few thousand files; at the defaults (200 pictures every
five minutes) it fills up over a few hours in the background. Turn
`fetch_images` off if you would rather Home Assistant made no outbound requests
at all.

### `catalog_url`

Where the catalogue archive comes from. By default the latest build of
[rgriebl/brickstore-database][db], which is refreshed automatically.

## Where the data lives

Everything mutable is in the add-on folder,
`/addon_configs/<slug>_brickcollector/`:

| File | What it is |
|------|------------|
| `brickcollector.sqlite` | the whole collection and the catalogue |
| `downloads.zip` | the catalogue archive; kept so the next update can compare CRC32 values instead of fetching everything again |
| `catalog.imported` | a mark that the catalogue was unpacked on the add-on's first start |
| `catalog-status.json` | what the catalogue is doing: whether an update is running, and when the last one finished |
| `images/` | cached pictures of the items in the collection |
| `app_key` | the application key; sessions are signed with it, so do not lose it |

The add-on container is recreated on every update; the folder is not. A backup
of the collection is a copy of `brickcollector.sqlite`.

## Updating the catalogue

**Settings → Catalogue → "Update the catalogue"** inside the application. It
downloads a fresh archive and rebuilds the catalogue, showing which step it is
on. You can leave the page — the work runs as its own process and carries on
without you. The collection is not touched: the catalogue and the collection
live in different tables.

On a small machine this takes minutes. The panel keeps working throughout.

## What is inside

PHP 8.4 under php-fpm, nginx in front of it, SQLite instead of a database
server. The application is [dimquea/BrickCollector][app]; the add-on builds it
from a tagged source when the image is built, so a rebuild gives you the same
thing it gave you last time.

## Licence

The application and this add-on are MIT. The image also carries Bootstrap, Vue,
Inertia, Tom Select and the Material Design Icons font, which are MIT and
Apache-2.0; their own licences travel inside the image with them.

The catalogue is not part of the image. It is downloaded to your own machine
from [rgriebl/brickstore-database][db] on first start, and item pictures come
from BrickLink. That data belongs to its owners and is not covered by the
licence above.

[db]: https://github.com/rgriebl/brickstore-database
[app]: https://github.com/dimquea/BrickCollector
