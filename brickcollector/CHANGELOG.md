# Changelog

## 1.1.0.0

Built from BrickCollector 1.1.0.

- **Assemblies** — a section for custom models made of loose parts. Parts move
  in from the loose pile and back out again; the collection holds the same
  bricks either way.
- Loose parts are kept in lots, each with its own purchase, storage and page.
- A catalogue page says what the item is part of.
- Parts are counted in four places — sets, minifigures, loose, assemblies — and
  what is missing is asked apart from where the part sits.
- The list filters work again: the switches ("Incomplete", "Missing figures")
  quietly filtered nothing, and under Ingress a refused filter landed on an
  image instead of the list.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.0.0.0

First release, built from BrickCollector 1.0.0.

- A panel in the Home Assistant sidebar; Ingress is the only way in.
- The database, the image cache and the catalogue archive live in the add-on
  folder, outside the container.
- The BrickLink catalogue is downloaded and unpacked on first start, and can be
  refreshed later from the application's settings.
- Pictures of the items in the collection are cached in the background;
  everything else is shown straight from the source.
