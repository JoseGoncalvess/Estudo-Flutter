void main() {
  List number = [];
  for (var i = 0; i < 100; i++) {
    print(number);
    number.add(i);
    if (i == 50) {
      print('Já foi metade');
    }
  }
}
