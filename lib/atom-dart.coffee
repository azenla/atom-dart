AtomDartView = require './atom-dart-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomDart =
  atomDartView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    analysisClient = require './analysis_client.dart.js'
    console.log analysisClient
    @atomDartView = new AtomDartView(state.atomDartViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomDartView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-dart:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomDartView.destroy()

  serialize: ->
    atomDartViewState: @atomDartView.serialize()

  toggle: ->
    console.log 'AtomDart was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
