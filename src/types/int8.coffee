module.exports =
  read: (buffer) ->
    return buffer.readInt8()
  write: (buffer, value) ->
    buffer.writeInt8 value
  size: 1
