import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/settings.dart';
import 'package:shopping/themes/dark-yellow.theme.dart';
import 'package:shopping/themes/dark.theme.dart';
import 'package:shopping/themes/light.theme.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(String color) {
    switch (color) {
      case 'light':
        {
          theme = lightTheme();
          break;
        }
      case 'dark':
        {
          theme = darkTheme();
          break;
        }
      case 'dark-yellow':
        {
          theme = darkYellowTheme();
          break;
        }
      default:
        {
          color = 'light';
          theme = lightTheme();
          break;
        }
    }

    Settings.theme = color;
    notifyListeners();
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString('theme');
    Settings.theme = theme.isEmpty ? 'light' : theme;
    change(Settings.theme);
  }
}
