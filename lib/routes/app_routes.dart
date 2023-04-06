// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;

}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const HOME = '/home';

}
