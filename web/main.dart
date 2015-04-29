import 'package:atom/atom.dart';
import 'package:atom_dart/views.dart';

DartOutlineView outlineView;
PubOutputView pubOutputView;

void initDefaultCommands() {
  atom.commands.add('atom-workspace', 'atom-dart:toggle-outline-view', (_) {
    outlineView.toggle();
  });
  atom.commands.add('atom-workspace', 'atom-dart:toggle-pub-output-view', (_) {
    pubOutputView.toggle();
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
