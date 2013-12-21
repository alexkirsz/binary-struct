module.exports =
  read: (buffer) ->
    value = buffer.buf[buffer.read_offset]
    buffer.read_offset++
    return value
  write: (buffer, value) ->
    buffer.buf[buffer.write_offset] = value
    buffer.write_offset++
  size: 1
