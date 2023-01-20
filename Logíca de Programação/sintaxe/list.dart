///LISTA D EUMA GALERA
main() {
  List<String> nomes = ['José', 'Anny', 'maria', 'guilherme', 'maykon', 'gui'];
  //COLOCANDO MUNDIÇA NA LISTA
  nomes.add('Fulano');
  nomes.add('ciclano');
  nomes.add('beutrano');
  nomes.add('ele');

  print(nomes);
//TIRANDO  UMA GALERA
  nomes.remove('ele');
  print(nomes);
  nomes.removeAt(0);
  print(nomes);
}
