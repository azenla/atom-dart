import 'package:atom/atom.dart';
import 'package:atom_dart/plugin.dart';
import 'package:logging/logging.dart';

void _initLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() {
  _initLogging();
  AtomDartPlugin _atomDartPlugin = new AtomDartPlugin();
  onPackageActivated(_atomDartPlugin.activate);
}
