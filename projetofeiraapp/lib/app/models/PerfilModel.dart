class PerfilModel {
  late String nome;
  late String sobrenome;
  late String avatar;
  late List<PerfilModel> amigos;

  PerfilModel();

  String NomeCompleto(){
    return nome + " " + sobrenome;
  }
}
