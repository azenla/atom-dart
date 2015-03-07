# Atom Dart

IDE-like support for Dart in Github's Atom

## Current features
- Basic syntax highlighting
- Editor function for `pub get`

## Planned Features
- Full syntax highlighting
- Linting via Dart's `analysis_server` or `dartanalyzer`
- Code completion via `analysis_server`
- Automatic formatting via `dartfmt` or [dart_style](https://pub.dartlang.org/packages/dart_style)
- Project templates
- Snippets for common Dart code (such as getters, setters, functions (async, non-async), classes, future chaining, etc.
- Editor functions for common pub commands (get, build, serve, run)
- A browser for pub packages

## Notes
- When running `pub get` and the output box shows up on the bottom, you can close that via Ctrl+Shift+P -> 'Atom Dart: Clear Output'
