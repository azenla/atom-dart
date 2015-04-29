library atom_dart.sdk;

import 'package:atom/atom.dart';
import 'package:logging/logging.dart';

final _log = new Logger('atom_dart.sdk');

abstract class DartSdkCall {
  Future _invoke();
}

class Pub implements DartSdkCall {
  Future build();
  Future serve();

  Future _invoke() async {
    print('Invoking pub');
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
