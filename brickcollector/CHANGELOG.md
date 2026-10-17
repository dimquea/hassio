# Changelog

## 1.8.0.0

Built from BrickCollector 1.8.0.

- **Direct access, if you want it.** The panel cannot do one thing: the camera — a page inside
  the panel's frame may not use it. Enter a port under **Network** on the Configuration tab and
  the application is also reachable at `http://<Home Assistant address>:<port>`. Off until a port
  is entered. **There is no login on that port**: home network only, never forwarded on a router.
  On that port the Ingress header is wiped, so nobody can rewrite the links on a page with it, and
  the Ingress port itself now answers Home Assistant only.
- **Pick a set from the collection.** The catalogue card of a set or a minifigure tells how much
  of it is already here — anywhere, in other sets, or loose — exports what is short, and can add
  the set built from loose parts: a CSV says beforehand which lots go and where they are stored,
  and whatever is not found is marked missing.
- **Part a set out.** Its parts go to the loose pile, its minifigures become copies of their own,
  with the storage place and purchase date of the set.
- **The shortage of a set exports from its page**, group by group, the whole tree.
- **A note on a minifigure or a sub-set inside a set** — a crack in a leg — shown on the
  figure's card too.
- **A camera button in the photo search**, under Settings → Search by photo, for when the
  application is opened directly.
- Fixes: under the "missing" filter every kind of export carries the shortage; opening a section
  no longer sends two requests, and the message after removing a set stays on screen.

Updating: the database gains one column on the first start, by itself. Nothing to configure —
direct access stays off unless you enter a port.

## 1.7.0.0

Built from BrickCollector 1.7.0.

- **The number printed in the instructions finds the part.** A LEGO element
  number — 4243815 — is what an instruction and the Pick a Brick shelf call a
  part, and until now nothing answered to it, although the catalogue has known
  111 thousand of them all along. Alternate BrickLink numbers too. Both work in
  the catalogue and in the sections of the collection, where the question
  usually is "do I have this brick". In the parts list the match is exact to the
  row — an element number names a part in a colour, which is just what a row
  there is.
- **Narrowing a theme to a sub-theme.** "Star Wars" is a thousand sets in the
  catalogue and often half a shelf at home. A second list appears under the
  first once a theme is chosen: the catalogue offers every sub-theme, a section
  of the collection only what it holds. Links keep working as they were.
- **A colour for everything that has one.** The Throwbot storage case comes in
  a different colour in each of 8500 through 8507, and five hundred such items
  are recorded with a colour. The card offers those colours now, and a copy
  added to the collection remembers the one it was added in.
- A fix: a long value made a dropdown stand twice as tall as its neighbours.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.6.0.0

Built from BrickCollector 1.6.0.

- **What a set holds besides parts and figures** — gear, a book, a catalogue.
  Those lines were in the collection all along and shown nowhere; now each kind
  has its own group on the page of a set and its own number on the catalogue
  card, with its colour. The storage case in 8500 through 8507 comes in a
  different one each time, and all eight used to look alike.
- **"Refresh the inventories"**, under Settings → Catalogue. An inventory is
  copied into the collection when something is added and lives on its own
  after that. When the catalogue is later corrected, this rebuilds the
  inventories of sets and figures from it — by hand, never by itself. Marks for
  missing pieces are carried to their places; any that have nowhere to go are
  listed rather than quietly dropped. Assemblies and loose lots are left alone.
- **"Serve pictures through the application"**, under Settings → Appearance,
  on by default. Turned off, the browser fetches a picture from BrickLink
  itself and it appears without waiting for the background download.
- **"Incomplete" in the minifigure filter** — figures missing a piece of their
  own, which until now showed only from inside the set holding them.
- **Three kinds of export**, chosen by name: an inventory and a wanted list,
  both BrickLink XML as before, and a BrickStore basket (.bsx), which opens in
  BrickStore by double click.
- **A picture zooms by wheel and by pinch** instead of the one step a double
  click gave, and what no longer fits is dragged.
- **Each section remembers how it was last sorted.**
- Two fixes: a minifigure inside a minifigure — a Technic figure with a helmet
  — was counted twice, and the analytics tables counted copies in one column
  and distinct item numbers in the next under headings that read the same.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.5.1.0

Built from BrickCollector 1.5.1.

- The row of a minifigure inside a set ran off the card on a phone, carrying
  its chevron off the edge. The row now holds the item number and the counts,
  and the name moved into the body, where there is room to write it out in
  full. On a narrow screen the badges for spares and losses keep their numbers
  and drop the word before them.
- A picture inside a card always opens now. In 1.5.0 the magnifier appeared on
  one picture and not on the next, depending on the size of the file behind it,
  with nothing on screen to explain the difference.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.5.0.0

Built from BrickCollector 1.5.0.

- **A picture opens at its own size.** In a table a picture is the size of a
  thumbnail and in a card about three hundred points, while the file behind it
  is two to three times that, so the pattern on a printed tile could not be
  made out. A click on a picture inside a card — the main one, or a thumbnail
  in a table of what something holds or where it turns up — shows it on a
  dimmed layer, up to 95% of the window; a double click doubles that. Lists
  keep what they had: there a picture is how one opens the thing.
- **"In the collection" on a catalogue card** — whether the thing is here and
  where exactly, with a tab per place: loose lots, copies, the sets and figures
  it is built into, the assemblies it went to. For a part it follows the colour
  of the card.
- Two fixes: the second page of "part of" landed on the home page, and a
  minifigure holding a part opened in the catalogue instead of the collection.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.4.2.0

Built from BrickCollector 1.4.2.

- Filtering loose parts by a tag shows how much is actually tagged: the loose
  column reads "11 (12)" — the tagged lots, then everything loose — and an
  export under a tag takes only the tagged lots.
- A hint whose placeholders began with one another's names came out garbled;
  translations are filled in one pass now.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.4.1.0

Built from BrickCollector 1.4.1.

- **Import into an assembly** — the piece left out of 1.4.0. The import's
  switch gains a way into an assembly, with the assemblies beside it and a new
  one at the top; a new assembly takes the name of the file. Parts go in the
  way they do from the catalogue, so the same part in the same colour folds
  into one line and the loose pile is left as it was. Only parts go in, and an
  import where nothing fits creates no empty assembly.

Nothing to do when updating: no new options, no change to the database. The
add-on folder and everything in it stay as they are.

## 1.4.0.0

Built from BrickCollector 1.4.0.

- **Import from a BrickLink XML file** — a section of its own. The file is read
  and shown first, and nothing is created until the rows are ticked and the
  button pressed. Both kinds of file are understood: an inventory goes into the
  collection, a wanted list into the wishlist, and a switch overrides that.
  Details entered above apply to every entry created, a row can override them,
  and a remark from the file becomes that entry's note.
- **Finding a part by photograph**, through Brickognize. It stays off until you
  switch it on under Settings, where the reason is written beside the switch:
  the photo goes to an outside service and, by that service's terms, stays with
  it. Under the panel there is no separate camera button — a browser grants an
  iframe the camera only when the page embedding it says so — but the system
  file picker offers the camera itself on a phone.
- A composite part — a torso, a pair of legs — is counted once again, instead of
  once as itself and once more as the pieces it is described by.
- Redirects name where they go: adding a picture to an assembly no longer lands
  on the home page.

Updating tidies the collection once, removing the rows that were written for the
pieces of composite parts. Nothing else changes: no new options, and the add-on
folder is left alone.

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
