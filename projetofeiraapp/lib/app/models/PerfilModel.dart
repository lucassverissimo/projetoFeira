class PerfilModel {
  late String id;
  late String nome;
  late String sobrenome;
  late String avatar;
  late List<PerfilModel> amigos;
  
  PerfilModel();

  String nomeCompleto(){
    return nome + " " + sobrenome;
  }
}
