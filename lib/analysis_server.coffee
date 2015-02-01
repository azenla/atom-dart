path = require "path"
{BufferedProcess} = require 'atom'

module.exports = analysis_server =
  sdkPath: null
  hostname: null
  port: null
  process: null

  start: () ->
    console.log("Starting analysis server")
    @sdkPath = atom.config.get('atom-dart.sdkPath')

    if @sdkPath
      analysisServerPath = path.join(@sdkPath, "/bin/snapshots/analysis_server.dart.snapshot")
      console.log(analysisServerPath)

      command = "dart"
      args = [analysisServerPath]
      stdout = (output) -> analysis_server.out.write(output)
      stderr = (err) -> console.error("analysis server error: #{err}")
      exit = (code) -> console.log("analysis server exited with #{code}")

      @process = new BufferedProcess({command, args, stdout, stderr, exit, options: {
        cwd: path
      }})

    else
      console.log("Dart SDK not set")

  shutdown: () ->
    request = {
      "id": "shutdownRequest"
      "method": "server.shutdown"
    }

    reqJson = JSON.stringify(request)
    console.log reqJson
    @process.process.stdin.write(reqJson)
