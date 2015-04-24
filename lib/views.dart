library atom_dart.views;

import 'dart:html';
import 'package:atom/atom.dart';

class View {
  Element get element => _element;
  Element _element;

  Panel get panel => _panel;
  Panel _panel;

  bool _visible = true;

  build() {
  }

  void bindRightPanel() {
    _panel = atom.workspace.addRightPanel(element);
  }

  void bindLeftPanel() {
    _panel = atom.workspace.addLeftPanel(element);
  }

  void bindBottomPanel() {
    _panel = atom.workspace.addBottomPanel(element);
  }

  void bindTopPanel() {
    _panel = atom.workspace.addTopPanel(element);
  }

  void bindModalPanel() {
    _panel = atom.workspace.addModalPanel(element);
  }

  void toggle() {
    if (_visible) {
      hide();
    } else {
      show();
    }
  }

  void show() {
    if (_panel != null) {
      _panel.show();
      _visible = true;
    }
  }

  void hide() {
    if (_panel != null) {
      _panel.hide();
      _visible = false;
    }
  }

  invalidate() {
    build();
  }
}

class DartOutlineView extends View {
  List items = [];

  UListElement _listElement;
  DivElement _body;

  DartOutlineView();

  @override
  build() {
    _body = new DivElement();
    _listElement = new UListElement();

    _element = new DivElement()
      ..id = 'dart-outline-view'
      ..children = [
        new DivElement()
          ..classes = ['panel-heading']
          ..text = 'Outline'
          ..children.addAll([
            new SpanElement()
              ..text = 'x'
              ..classes = ['close-panel-button', 'pull-right']
              ..onClick.listen((evt) {
                hide();
              })
          ]),
        _body
          ..classes = ['panel-body', 'padded']
          ..children = [
            _listElement
          ]
      ];

    for (var item in items) {
      _listElement.children.add(item);
    }
  }

  addItem(String item) {
    items.add(item);
    _listElement.children.add(new LIElement()..text = item);
  }
}

class PubOutputView extends View {
  var _outputElement;

  set text(String val) => _outputElement.text = val;

  PubOutputView();

  @override
  build() {
    _outputElement = new SpanElement();

    _element = new DivElement()
      ..id = 'pub-output-view'
      ..children = [
        new DivElement()
          ..classes = ['panel-heading']
          ..text = 'Pub Output'
          ..children.addAll([
            new SpanElement()
              ..text = 'x'
              ..classes = ['close-panel-button', 'pull-right']
              ..onClick.listen((evt) {
                hide();
              })
          ]),
        new DivElement()
          ..classes = ['panel-body', 'padded']
          ..children = [
            _outputElement
          ]
      ];
  }
}

class DartIssuesView extends View {

  DartAutoCompleteView();

  @override
  build() {
    _element = new DivElement()
      ..id = 'dart-issues-view'
      ..classes = []
      ..children = [
        new UListElement()
      ];
  }
}
