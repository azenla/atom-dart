{CompositeDisposable} = require 'atom'
{AnalysisClient} = require './analysis-client'

module.exports = AtomDart =
  subscriptions: null
  analysisClient: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable()
    @analysisClient = new AnalysisClient()

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-dart:toggle': => @toggle()

    console.log 'Atom Dart was activated!'

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  toggle: ->
