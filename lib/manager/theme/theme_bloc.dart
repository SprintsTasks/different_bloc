import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(InitialTheme(themeData: ThemeData.light(useMaterial3: true))) {
    on<ChangeThemeEvent>(_changeTheme);
  }
  bool isDark = false;
  Future<void> _changeTheme(
      ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    isDark = !isDark;
    emit(ChangeThemeState(
        themeData: isDark
            ? ThemeData.dark(useMaterial3: true)
            : ThemeData.light(useMaterial3: true)));
  }
}
