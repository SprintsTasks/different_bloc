part of 'theme_bloc.dart';
@immutable
abstract class ThemeState {
  final ThemeData themeData;

  const ThemeState({required this.themeData});
}

class InitialTheme extends ThemeState {
  const InitialTheme({required super.themeData});
}

class ChangeThemeState extends ThemeState {
  const ChangeThemeState({required super.themeData});
}
