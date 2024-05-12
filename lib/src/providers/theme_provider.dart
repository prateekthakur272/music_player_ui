import 'package:flutter/material.dart';
import 'package:music_player_ui/src/shared/themes.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _theme = themeLight;
  ThemeData get theme => _theme;

  bool get isDark => _theme == themeDark;
  set theme(ThemeData theme){
    _theme = theme;
    notifyListeners();
  }

  void toggleTheme(){
    _theme = isDark?themeLight:themeDark;
    notifyListeners();
  }
}