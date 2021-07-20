meta:
  id: lsr_trk
  title: LEGO Stunt Rally track file
  application: LEGO Stunt Rally
  file-extension: trk
  license: Unlicense
  endian: le
seq:
  - id: magic
    type: str
    size: 12
    terminator: 0
    encoding: ASCII
    doc: This appears to be unchecked by the game.
  - id: trk_version
    type: u4
    doc: All known files are version 5.
  - id: file_len
    type: u4
    doc: This should always be 65,576 (0x10028) bytes long.
  - id: trk_size
    type: u4
    enum: trk_size
    doc: 8x8 or 16x16, more theoretically possible but never seen.
  - id: trk_theme
    type: u4
    enum: trk_theme
    doc: Track theme doesn't directly change track pieces, changes scenery only
  - id: trk_time
    type: u4
    enum: trk_time
enums:
  trk_size:
    0: multiplayer
    1: singleplayer
  trk_theme:
    0: jungle
    1: arctic
    2: desert
    3: city
  trk_time:
    0: day
    1: night
instances:
  track_tile:
    pos: 0x20
    size: 0x10
    repeat: expr
    repeat-expr: 0x1000
    type: track_tile
  footer:
    pos: 0x10020
    size: 8
    type: footer
types:
  track_tile:
    seq:
      - id: unknown_data
        type: u4
      - id: height
        type: f4
        doc: Ground level is -1, and each level is a multiple of 8.
      - id: piece_id
        type: u4
        doc: These IDs are listed in the MOTO.rtb file alongside the game.
      - id: rotation
        type: u4
        enum: rotation
    enums:
      rotation:
        0: west
        1: north
        2: east
        3: south
  footer:
    seq:
      - id: padding
        size: 4
      - id: finalized
        type: u4
        doc: Used by game to check if the track is playable.