module.exports = (methods, args) ->
  type =
    read: methods.read
    write: methods.write
    size: methods.size

  return type
