struct = require '../struct'

module.exports = struct
  read: (length) ->
    value = @buffer.buf[@buffer.read_offset...@buffer.read_offset + length]
    @buffer.read_offset += length
    return value
  write: (value) ->
    value.copy @buffer.buf.write, @buffer.write_offset
    @buffer.write_offset += value.length
  skip: (value) ->
    @move value.length
