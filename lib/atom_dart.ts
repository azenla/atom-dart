import atom = require('atom');
import analysis = require('./analysis');
import utils = require('./utils');

export function activate(state) {
  console.log('Starting AtomDart');




  // var dartSdkPath = atom.config.get('atom-dart.dartSdkPath');
  var analysisServer = new analysis.AnalysisServer('c:\\program files (x86)\\dart-sdk');
  analysisServer.start();
}

export function deactivate() {
}

export function serialize() {
}

export function toggle() {
}
