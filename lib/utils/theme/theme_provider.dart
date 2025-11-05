import 'package:flutter/cupertino.dart';
import 'package:job_app/common/common.dart';
import 'package:flutter/scheduler.dart';
import 'package:job_app/utils/theme/base_theme.dart';

import 'light_dark_theme.dart';

class ThemeProvider with ChangeNotifier {
  void setTheme(Brightness brightness) {
    ThemeType themeType = (brightness == Brightness.dark)
        ? ThemeType.dark
        : ThemeType.light;
    themeType = (brightness == Brightness.dark) ? ThemeType.dark : themeType;
    notifyListeners();
  }

  BaseTheme get colors {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    if (brightness == Brightness.dark) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }
}
