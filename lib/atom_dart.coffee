fs = require "fs"
path = require "path"
{CompositeDisposable} = require "atom"
sdk = require "./sdk.coffee"
DartSdkOutputView = require "./dart_sdk_output_view"

module.exports = AtomDart =
  subscriptions: null
  sdkOutputView: null
  modalPanel: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable()
    @sdkOutputView = new DartSdkOutputView()
    sdk.pub.out = @sdkOutputView
    sdk.analysisServer.out = @sdkOutputView

    # Register command that toggles this view
    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:pub-get": => sdk.pub.get()
    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:pub-build": => sdk.pub.build()

    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:set-analysis-roots": => sdk.analysisServer.analysis.setAnalysisRoots()
    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:start-analysis-server": => sdk.analysisServer.start()
    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:shutdown-analysis-server": => sdk.analysisServer.shutdown()
    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:analysis-set-subscriptions": => sdk.analysisServer.server.setSubscriptions()

    console.log("Atom Dart was activated!")
    console.log(sdk)

    # Check if the current directory has a pubspec.yaml in it, if it does, start
    # the analyzer.
    if (atom.project.getPaths().length > 0)
      pubspecExists = fs.existsSync(path.join(atom.project.getPaths()[0], "pubspec.yaml"))
      if (pubspecExists)
        if (atom.config.get("atom-dart.autoRunPub") == true)
          sdk.pub.get()
        sdk.analysisServer.start()
        sdk.analysisServer.analysis.setAnalysisRoots()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  toggle: ->
