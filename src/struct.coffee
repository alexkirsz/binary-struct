fs = require 'fs'
OffsetBuffer = require 'offset-buffer'

module.exports = create = (methods, args) ->
  struct = ->
    create methods, arguments

  struct.read = (buffer) ->
    read = (subType) -> subType.read buffer
    skip = (subType) -> subType.skip buffer
    move = (n) -> buffer.read_offset += n
    return methods.read.apply { buffer, read, skip, move }, args

  struct.write = (buffer, value) ->
    write = (subType, subValue) -> subType.write buffer, subValue
    move = (n) -> buffer.write_offset += n
    return methods.write.call { buffer, write, move }, value

  struct.skip =
    if methods.size then (buffer) ->
      buffer.read_offset += methods.size
    else if methods.skip then (buffer) ->
      read = (subType) -> subType.read buffer
      skip = (subType) -> subType.skip buffer
      move = (n) -> buffer.read_offset += n
      methods.skip.apply { buffer, read, skip, move }, args

  struct.size = methods.size

  struct.fromFile = (src) ->
    buffer = new OffsetBuffer (fs.readFileSync src)
    return struct.read buffer

  struct.fromBuffer = (buf) ->
    buffer = new OffsetBuffer buf
    return struct.read buffer

  return struct
