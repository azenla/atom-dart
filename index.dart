import 'dart:html';
import 'package:atom/atom.dart';
import 'package:atom_dart/views.dart';

DartOutlineView outlineView;
PubOutputView pubOutputView;

class AnalysisError {
  final AnalysisErrorSeverity severity;
  final AnalysisErrorType type;
  final Location location;
  final String message;
  final String correction;

  AnalysisError(this.severity, this.type, this.location, this.message, this.correction);

  factory AnalysisError.fromJSON(Map<String, dynamic> json) {
    var s = AnalysisErrorSeverity.forName(json["severity"]);
    var t = AnalysisErrorType.forName(json["type"]);
    var loc = new Location.fromJSON(json["location"]);
    var m = json["message"];
    var c = json["correction"];

    return new AnalysisError(s, t, loc, m, c);
  }
}

void initDefaultCommands() {
  atom.commands.add('atom-workspace', 'atom-dart:toggle-outline-view', (e) {
    outlineView.toggle();
  });
}

void activate() {
  print('Activating Atom Dart');

  outlineView = new DartOutlineView();
  outlineView.build();
  outlineView.addItem('item 1');
  outlineView.bindRightPanel();

  pubOutputView = new PubOutputView();
  pubOutputView.build();
  pubOutputView.text = 'Hello world';
  pubOutputView.bindBottomPanel();

  initDefaultCommands();
}

main() => onPackageActivated(activate);
