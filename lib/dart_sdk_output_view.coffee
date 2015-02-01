{CompositeDisposable} = require "atom"

module.exports =
class DartSdkOutputView
  subscriptions: null
  message: null

  constructor: (serializeState) ->
    # Create root element
    @element = document.createElement("div")
    @element.classList.add("dart-sdk-output-view")

    # Create message element
    @message = document.createElement("pre")
    @message.textContent = ""
    @element.appendChild(@message)
    @modalPanel = atom.workspace.addBottomPanel(item: @element, visible: false)

    @subscriptions = new CompositeDisposable()

    @subscriptions.add atom.commands.add "atom-workspace", "atom-dart:clear-output": =>
      @message.textContent = ""
      @modalPanel.hide()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  write: (msg) ->
    @message.textContent += msg
    @modalPanel.show()
