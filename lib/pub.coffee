{BufferedProcess} = require 'atom'

module.exports = pub =
  command: 'pub'
  out: null

  get: () ->
    console.log("Running pub get")

    args = ['get']
    stdout = (output) -> pub.out.write(output)
    stderr = (err) -> console.error("pub get error: #{err}")
    exit = (code) -> console.log("pub get exited with #{code}")

    for path in atom.project.getPaths()
      process = new BufferedProcess({command: pub.command, args, stdout, stderr, exit, options: {
        cwd: path
      }})

  build: () ->
    console.log("Running pub build")

    args = ['build']
    stdout = (output) -> pub.out.write(output)
    stderr = (err) -> console.error("pub build error: #{err}")
    exit = (code) -> console.log("pub build exited with #{code}")

    for path in atom.project.getPaths()
      process = new BufferedProcess({command: pub.command, args, stdout, stderr, exit, options: {
        cwd: path
      }})
