# Changelog

## 1.0.0.0

First release, built from BrickCollector 1.0.0.

- A panel in the Home Assistant sidebar; Ingress is the only way in.
- The database, the image cache and the catalogue archive live in the add-on
  folder, outside the container.
- The BrickLink catalogue is downloaded and unpacked on first start, and can be
  refreshed later from the application's settings.
- Pictures of the items in the collection are cached in the background;
  everything else is shown straight from the source.
