struct = require '../struct'

module.exports = struct
  read: (length, encoding) ->
    value = @buffer.buf.toString encoding, @buffer.read_offset, @buffer.read_offset + length
    @buffer.read_offset += length
    return value
  write: (value, encoding) ->
    @buffer.buf.write value, encoding
    @buffer.write_offset += Buffer.byteLength value, encoding
  skip: (value, encoding) ->
    @move (Buffer.byteLength value, encoding)
