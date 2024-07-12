import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme({required ThemeMode themeMode}) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    if (json['themeMode'] == 'light') {
      return ThemeMode.light;
    } else if (json['themeMode'] == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'themeMode': state == ThemeMode.light
          ? 'light'
          : state == ThemeMode.dark
              ? 'dark'
              : 'system',
    };
  }
}
