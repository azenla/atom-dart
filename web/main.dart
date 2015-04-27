import 'package:atom/atom.dart';
import 'package:atom_dart/views.dart';

DartOutlineView outlineView;
PubControlView pubControlView;

void initDefaultCommands() {
  atom.commands.add('atom-workspace', 'atom-dart:toggle-outline-view', (_) {
    outlineView.toggle();
  });
  atom.commands.add('atom-workspace', 'atom-dart:toggle-pub-output-view', (_) {
    pubControlView.toggle();
  });
}

void activate() {
  print('Activating Atom Dart');

  outlineView = new DartOutlineView();
  outlineView.build();
  outlineView.addItem('item 1');
  outlineView.bindRightPanel();
  outlineView.hide();

  pubControlView = new PubControlView();
  pubControlView.build();
  pubControlView.text = 'Hello world';
  pubControlView.bindBottomPanel();
  pubControlView.hide();

  initDefaultCommands();
}

main() => onPackageActivated(activate);
