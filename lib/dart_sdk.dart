library atom_dart.dart_sdk;

import 'packages/atom/atom.dart';

abstract class SdkCall {
  invoke(String command, List args);
}

class Pub implements SdkCall {
  build();
  serve();
}

class Dart2JS implements SdkCall {
  compile();
}

class DartVM implements SdkCall {
  run();
}

class AnalysisServer implements SdkCall {
  start();
  stop();
}

class DartDocGen implements SdkCall {

}

class DartAnalyzer implements SdkCall {

}
