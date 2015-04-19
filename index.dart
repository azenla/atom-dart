import 'packages/atom/atom.dart';

import 'package:atom_dart/dart_sdk.dart' as sdk;

void activate() {
  print('Hello world');
}

void _startAnalysisServer() async {

}

main() => onPackageActivated(activate);
