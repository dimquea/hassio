# Changelog

## 1.3.0.0

Built from BrickCollector 1.3.0.

- **Export to BrickLink XML** — a button beside the ordering in every list, and
  what comes out is exactly what the filter shows: what you hold as an
  inventory, what is missing as a wanted list with the sets it is missing from
  written in the remarks. An assembly exports what it is made of and, apart
  from that, what it still needs.
- **Two more filters** — minifigures a set is missing, and parts by a tag put
  on a loose lot. The part page also names the tags of its lots, which until
  now could be seen only by opening the lot itself.
- **Colour is shown as a colour** — every colour select carries the same swatch
  as the tables do. The catalogue card keeps the colour you arrived in as well:
  the picture, the links out and the dialog that adds to the collection all
  follow it.
- The redirect fix for the panel: under Ingress a redirect went out with an
  absolute address, which the panel refuses. Adding to the wishlist failed
  there, and the message about what had happened sat in the session until some
  later page showed it.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.2.0.0

Built from BrickCollector 1.2.0.

- **A wishlist** — a section for what the collection does not hold but you
  want. A list and nothing more; a row leads back to the catalogue. Parts are
  wanted in a colour, sets and minifigures are not. Pictures of wished items
  are cached in the background, the way the collection's are.
- **Lists can be ordered** — by item number, name, year, or by how much is
  held — with a direction beside it. The choice lives in the address, so it
  survives filtering and paging and can be sent to someone as a link.
- **A dark interface** — system, light or dark, under Settings. System follows
  what the device is set to and changes with it.
- Three fixes: assemblies were missing from the "add a part" dialog; a part
  missing from a set only as a counterpart — the same brick listed twice, with
  a sticker and without — was counted nowhere outside that set's own page; and
  dropdown options looked disabled on a dark interface.

Updating adds a table for the wishlist on first start. Nothing else changes:
no new options, and the add-on folder stays as it is.

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
