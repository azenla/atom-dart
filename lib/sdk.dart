library atom_dart.sdk;

import 'dart:async';
import 'package:atom/atom.dart';
import 'package:logging/logging.dart';

final _log = new Logger('atom_dart.sdk');

abstract class DartSdkCall {
  Future _invoke();
}

class Pub implements DartSdkCall {
  Future build() {
    return _invoke();
  }
  Future serve();

  Future _invoke() async {
    var pub = new BufferedProcess('ls', [],
      stdout: _handleStdout,
      exit: (_) {
        print('Pub exit');
      }
    );
  }

  void _handleStdout(String data) {
    print('stdout:');
    print(data);
  }
}

class Dart2JS implements DartSdkCall {
  compile();
}

class DartVM implements DartSdkCall {
  run();
}

class DartDocGen implements DartSdkCall {
  run();
}

class DartAnalyzer implements DartSdkCall {
  run();
}
