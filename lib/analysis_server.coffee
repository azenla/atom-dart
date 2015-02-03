path = require "path"
{BufferedProcess} = require 'atom'

module.exports = analysis_server =
  sdkPath: null
  hostname: null
  port: null
  process: null
  id: 0

  send: (request) ->
    reqJson = JSON.stringify(request)
    console.log reqJson
    @process.process.stdin.write(reqJson + "\n")

  start: () ->
    console.log("Starting analysis server")
    @sdkPath = atom.config.get('atom-dart.sdkPath')

    if @sdkPath
      analysisServerPath = path.join(@sdkPath, "/bin/snapshots/analysis_server.dart.snapshot")
      console.log(analysisServerPath)

      command = "dart"
      args = [analysisServerPath, "--sdk", @sdkPath]
      stdout = (output) -> analysis_server.out.write(output)
      stderr = (err) -> console.error("analysis server error: #{err}")
      exit = (code) -> console.log("analysis server exited with #{code}")

      @process = new BufferedProcess({command, args, stdout, stderr, exit, options: {
        cwd: path
      }})
    else
      console.log("Dart SDK not set")

  shutdown: () ->
    analysis_server.id += 1
    request = {
      "id": "" + analysis_server.id
      "method": "server.shutdown"
    }
    analysis_server.send(request)

  analysis:
    setAnalysisRoots: () ->
      analysis_server.id += 1
      request = {
        "id": "" + analysis_server.id
        "method": "analysis.setAnalysisRoots"
        "params": {
          "included": [atom.project.getPaths()[0]]
          "excluded": []
        }
      }
      analysis_server.send(request)

  server:
    setSubscriptions: () ->
      analysis_server.id += 1
      request = {
        "id": "" + analysis_server.id
        "method": "server.setSubscriptions"
        "params": {
          "subscriptions": ["STATUS"]
        }
      }
      analysis_server.send(request)
