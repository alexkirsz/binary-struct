struct = require '../struct'

module.exports = struct (length, encoding) ->
  if typeof length is 'string'
    encoding = length

  @read = ->
    value = @buffer.buf.toString encoding, @buffer.read_offset, @buffer.read_offset + length
    @buffer.read_offset += Buffer.byteLength value, encoding
    return value
  @write = (value) ->
    @buffer.buf.write value, encoding
    @buffer.write_offset += Buffer.byteLength value, encoding
