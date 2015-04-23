library node;

import 'dart:async';
import 'dart:js' as js;

require(String name) => js.context.callMethod('require', [name]);

abstract class ChildProcess {
  Stream get onError;
  Stream get onExit;
  Stream get onClose;
  Stream get onDisconnect;
  Stream get onMessage;

  Stream get stdin;
  Stream get stdout;
  Stream get stderr;
  Stream get stdio;
  int get pid;
  bool get connected;

  void kill([String signal]);

  void send(Object message, [sendHandle]);

  ChildProcess();

  factory ChildProcess.spawn(String command, [List<String> args, Map options]) {
    // Call JS.
    return null;
  }
}
