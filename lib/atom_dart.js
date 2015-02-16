"use 6to5";

fs = require("fs");
path = require("path");
CompositeDisposable = require("atom").CompositeDisposable;
sdk = require("./sdk");
DartSdkOutputView = require("./dart_sdk_output_view");

module.exports = AtomDart = {
  subscriptions: null,
  sdkOutputView: null,
  modalPanel: null,

  activate: function(state) {
    // TODO: boot up the Dart script loader.
    this.subscriptions = new CompositeDisposable();
    this.sdkOutputView = new DartSdkOutputView();
    sdk.pub.out = this.sdkOutputView;
    sdk.analysisServer.out = this.sdkOutputView;

    this.subscriptions.add(
      atom.commands.add("atom-workspace",
        {
          "atom-dart:pub-get": () => sdk.pub.get()
        }
      )
    );
    this.subscriptions.add(
      atom.commands.add("atom-workspace",
        {
          "atom-dart:pub-build": () => sdk.pub.build()
        }
      )
    );
  },

  deactivate: function() {
    this.subscriptions.dispose();
  },

  loadDart2JSScript: function(uri) {

  }
};
