import 'package:atom/builder.dart';

Menu textMenu = menu('text-utils', contextMenu: true, selector: 'atom-workspace')
  .createMenu('Atom Dart');

void main() {
  package('atom-dart', '0.0.0', description: 'IDE experience for Dart in Atom (dev)');

  build();
}
