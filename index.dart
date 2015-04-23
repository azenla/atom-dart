import 'package:atom/atom.dart';
import 'package:atom_dart/views.dart';

DartOutlineView outlineView;
PubOutputView pubOutputView;

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
