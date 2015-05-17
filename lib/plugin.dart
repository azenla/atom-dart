library atom_dart.plugin;

import 'package:atom/atom.dart';
import 'package:logging/logging.dart';
import 'src/sdk.dart';
import 'src/analysis.dart';

final _log = new Logger('atom_dart.plugin');

class AtomDartPlugin {
  AtomDartPlugin();

  void activate() {
    _log.info('AtomDart plugin activated.');

    _initDefaultCommands();
  }

  void _initDefaultCommands() {
    atom.commands.add('atom-workspace', 'atom-dart:pub-get', (_) {
      _log.fine('Running pub get');
      var pub = new Pub();
      pub.get();
    });

    atom.commands.add('atom-workspace', 'atom-dart:pub-build', (_) {
      _log.fine('Running pub build');
      var pub = new Pub();
      pub.build();
    });
  }
}
