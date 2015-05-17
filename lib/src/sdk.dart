library atom_dart.sdk;

import 'dart:async';
import 'dart:js' as js;
import 'package:atom/atom.dart';
import 'package:logging/logging.dart';
import 'analysis.dart';

final _log = new Logger('atom_dart.sdk');

class BufferedProcessWrapper {
  BufferedProcess process;

  Stream<String> get stdout => _stdoutController.stream;
  Stream<String> get stderr => _stderrController.stream;
  Stream<String> get onExit => _onExitController.stream;

  StreamController<String> _stdoutController
      = new StreamController<String>(sync: true);
  StreamController<String> _stderrController
      = new StreamController<String>(sync: true);
  StreamController<String> _onExitController
      = new StreamController<String>(sync: true);

  BufferedProcessWrapper();

  void invoke(String command, List<String> args, Map options) {
    process = new BufferedProcess(command, args,
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

class Pub extends BufferedProcessWrapper {
  Pub() : super();

  void get() {
    var paths = atom.project.paths;
    if (paths.length > 1) {
      // Prompt the user for their choice of projects.
      throw new UnimplementedError();
    } else if (paths.length == 1) {
      // Just run in the current directory.
      var currentPath = paths.first;
      _pubGetSingleDirectory(currentPath);
    } else {
      // Error.
      throw new UnimplementedError();
    }
  }

  void build() {
    var paths = atom.project.paths;
    if (paths.length > 1) {
      // Prompt the user for their choice of projects.
      throw new UnimplementedError();
    } else if (paths.length == 1) {
      // Just run in the current directory.
      var currentPath = paths.first;
      _pubBuildSingleDirectory(currentPath);
    } else {
      // Error.
      throw new UnimplementedError();
    }
  }

  void _pubGetSingleDirectory(String directoryPath) {
    super.stdout.listen((data) {
      // print('Pub get stdout: $data');
      atom.notifications.addInfo('$data', {});
    });
    super.stderr.listen((data) {
      // print('Pub get stderr: $data');
      atom.notifications.addError('$data', {});
    });
    super.invoke('pub', ['get'], {
      'cwd': directoryPath
    });
  }

  void _pubBuildSingleDirectory(String directoryPath) {
    super.stdout.listen((data) {
      // print('Pub build stdout: $data');
      atom.notifications.addInfo('$data', {});
    });
    super.stderr.listen((data) {
      // print('Pub build stderr: $data');
      atom.notifications.addError('$data', {});
    });
    super.invoke('pub', ['build'], {
      'cwd': directoryPath
    });
  }
}
