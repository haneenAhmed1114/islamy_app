import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/shared/utils/cashe_helper.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode appThemeMode = ThemeMode.light;
  String localCode = 'en';

  bool get isDark => appThemeMode == ThemeMode.dark;

  void changeThemeMode(ThemeMode themeMode, {bool? fromShared})
  {
    if (fromShared != null) {
      appThemeMode = fromShared ? ThemeMode.dark : ThemeMode.light;
    }
    else
    {
      appThemeMode = themeMode;
    }
    CasheHelper.putBoolean(key: 'isDark', value: isDark).then((_) {
      notifyListeners();
    });
  }

  void changeAppLocal(String local) {
    localCode = local;
    notifyListeners();
  }
}
