{CompositeDisposable} = require "atom"
dart_sdk = require "./sdk.coffee"
DartSdkOutputView = require "./dart_sdk_output_view"

module.exports = AtomDart =
  subscriptions: null
  sdkOutputView: null
  modalPanel: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable()
    @sdkOutputView = new DartSdkOutputView()
    dart_sdk.pub.out = @sdkOutputView
    dart_sdk.analysisServer.out = @sdkOutputView

    # Register command that toggles this view
    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:pub-get": => dart_sdk.pub.get()
    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:pub-build": => dart_sdk.pub.build()
    # @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:start-analysis-server": => dart_sdk.analysisServer.start()
    # @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:shutdown-analysis-server": => dart_sdk.analysisServer.shutdown()

    console.log("Atom Dart was activated!")
    console.log(dart_sdk)

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  toggle: ->
