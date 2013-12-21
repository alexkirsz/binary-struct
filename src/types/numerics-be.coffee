exports.uint8 = require './uint8'
exports.int8 = require './int8'

exports.uint16 =
  read: (buffer) ->
    return buffer.readUInt16BE()
  write: (buffer, value) ->
    buffer.writeUInt16BE value
  size: 2

exports.int16 =
  read: (buffer) ->
    return buffer.readInt16BE()
  write: (buffer, value) ->
    buffer.writeInt16BE value
  size: 2

exports.uint24 =
  read: (buffer) ->
    return buffer.readUInt24BE()
  write: (buffer, value) ->
    buffer.writeUInt24BE value
  size: 3

exports.int24 =
  read: (buffer) ->
    return buffer.readInt24BE()
  write: (buffer, value) ->
    buffer.writeInt16BE value
  size: 3

exports.uint32 =
  read: (buffer) ->
    return buffer.readUInt32BE()
  write: (buffer, value) ->
    buffer.writeUInt32BE value
  size: 4

exports.int32 =
  read: (buffer) ->
    return buffer.readInt32BE()
  write: (buffer, value) ->
    buffer.writeInt32BE value
  size: 4

exports.uint64 =
  read: (buffer) ->
    return buffer.readUInt64BE()
  write: (buffer, value) ->
    buffer.writeUInt64BE value
  size: 8

exports.int64 =
  read: (buffer) ->
    return buffer.readInt64BE()
  write: (buffer, value) ->
    buffer.writeInt64BE value
  size: 8

exports.float =
  read: (buffer) ->
    return buffer.readFloatBE()
  write: (buffer, value) ->
    buffer.writeFloatBE value
  size: 4

exports.double =
  read: (buffer) ->
    value = buffer.buf.readDoubleBE buffer.read_offset
    buffer.read_offset += 8
    return value
  write: (buffer, value) ->
    buffer.buf.writeDoubleBE buffer.write_offset, value
    buffer.write_offset += 8
  size: 8
