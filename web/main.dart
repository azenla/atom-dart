import 'package:atom/atom.dart';
import 'package:atom_dart/views.dart';
import 'package:atom_dart/sdk.dart';

DartOutlineView outlineView;
PubOutputView pubOutputView;

void initDefaultCommands() {
  atom.commands.add('atom-workspace', 'atom-dart:toggle-outline-view', (_) {
    outlineView.toggle();
  });
  atom.commands.add('atom-workspace', 'atom-dart:toggle-pub-output-view', (_) {
    pubOutputView.toggle();
  });
  atom.commands.add('atom-workspace', 'atom-dart:pub-get', (_) {
    var pub = new Pub();
    pub.build();
  });
}

void activate() {
  print('Activating Atom Dart');

  outlineView = new DartOutlineView();
  outlineView.build();
  outlineView.addItem('item 1');
  outlineView.bindRightPanel();
  outlineView.hide();

  pubOutputView = new PubOutputView();
  pubOutputView.build();
  pubOutputView.text = 'Hello world';
  pubOutputView.bindBottomPanel();
  pubOutputView.hide();

  initDefaultCommands();
}

main() => onPackageActivated(activate);
