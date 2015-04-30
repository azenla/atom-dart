library atom_dart.sdk;

import 'dart:async';
import 'dart:js' as js;
import 'package:atom/atom.dart';
import 'package:logging/logging.dart';

final _log = new Logger('atom_dart.sdk');

class DartSdkCall {
  Stream<String> get stdout => _stdoutController.stream;
  Stream<String> get stderr => _stderrController.stream;
  Stream<String> get onExit => _onExitController.stream;

  StreamController<String> _stdoutController = new StreamController<String>(sync: true);
  StreamController<String> _stderrController = new StreamController<String>(sync: true);
  StreamController<String> _onExitController = new StreamController<String>(sync: true);

  DartSdkCall();

  void invoke(String command, List<String> args, Map options) {
    var process = new BufferedProcess(command, args,
      options: options,
      stdout: (data) {
        _stdoutController.add(data);
      },
      stderr: (data) {
        _stderrController.add(data);
      },
      exit: (_) {
        _onExitController.add(null);
      }
    );
  }
}

class Pub extends DartSdkCall {
  Pub() : super();

  void get(String cwd) {
    super.stdout.listen((data) {
      print('Pub stdout: $data');
    });
    super.stderr.listen((data) {
      print('Pub stderr: $data');
    });
    super.invoke('pub', ['get'], {'cwd': cwd});
  }
}
