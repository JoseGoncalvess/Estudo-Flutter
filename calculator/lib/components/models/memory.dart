class Memory {
  String _value = '0';
  void applyComand(String comand) {
    if (comand == 'AC') {
      _allClean();
    } else {
      _value += comand;
    }
  }

  _allClean() {
    _value = '0';
  }

  String get value {
    return _value;
  }
}
