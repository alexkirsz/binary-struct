type = require '../type'
exports.uint8 = require './uint8'
exports.int8 = require './int8'

exports.uint8 = type
  read: (buffer) ->
    value = buffer.buf[buffer.read_offset]
    buffer.read_offset++
    return value
  write: (buffer, value) ->
    buffer.buf[buffer.write_offset] = value
    buffer.write_offset++
  size: 1

exports.int8 = type
  read: (buffer) ->
    return buffer.readInt8()
  write: (buffer, value) ->
    buffer.writeInt8 value
  size: 1

exports.uint16 = type
  read: (buffer) ->
    return buffer.readUInt16LE()
  write: (buffer, value) ->
    buffer.writeUInt16LE value
  size: 2

exports.int16 = type
  read: (buffer) ->
    return buffer.readInt16LE()
  write: (buffer, value) ->
    buffer.writeInt16LE value
  size: 2

exports.uint24 = type
  read: (buffer) ->
    return buffer.readUInt24LE()
  write: (buffer, value) ->
    buffer.writeUInt24LE value
  size: 3

exports.int24 = type
  read: (buffer) ->
    return buffer.readInt24LE()
  write: (buffer, value) ->
    buffer.writeInt16LE value
  size: 3

exports.uint32 = type
  read: (buffer) ->
    return buffer.readUInt32LE()
  write: (buffer, value) ->
    buffer.writeUInt32LE value
  size: 4

exports.int32 = type
  read: (buffer) ->
    return buffer.readInt32LE()
  write: (buffer, value) ->
    buffer.writeInt32LE value
  size: 4

exports.uint64 = type
  read: (buffer) ->
    return buffer.readUInt64LE()
  write: (buffer, value) ->
    buffer.writeUInt64LE value
  size: 8

exports.int64 = type
  read: (buffer) ->
    return buffer.readInt64LE()
  write: (buffer, value) ->
    buffer.writeInt64LE value
  size: 8

exports.float = type
  read: (buffer) ->
    value = buffer.buf.readFloatLE buffer.read_offset
    buffer.read_offset += 4
    return value
  write: (buffer, value) ->
    buffer.buf.writeFloatLE buffer.write_offset, value
    buffer.write_offset += 4
  size: 4

exports.double = type
  read: (buffer) ->
    value = buffer.buf.readDoubleLE buffer.read_offset
    buffer.read_offset += 8
    return value
  write: (buffer, value) ->
    buffer.buf.writeDoubleLE buffer.write_offset, value
    buffer.write_offset += 8
  size: 8
