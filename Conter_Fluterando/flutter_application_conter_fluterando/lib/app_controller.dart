import 'package:flutter/foundation.dart';

class AppController extends ChangeNotifier {
  static AppController instace = AppController();

  bool isDarkthemeDark = false;
  changeTheme() {
    isDarkthemeDark = !isDarkthemeDark;
    notifyListeners();
  }
}
