import 'PerfilModel.dart';
import 'ProdutoFeiraModel.dart';

class FeiraModel {
  late String id;
  late String titulo;
  late String data;
  late String local;
  late PerfilModel autor;
  late List<PerfilModel> participantes;
  late List<ProdutoFeiraModel> itens;
  FeiraModel();

  @override
  String toString() {
    String retorno = "";
    retorno += "id: " + id + " / ";
    retorno += "titulo: " + titulo + " / ";
    retorno += "data: " + data + " / ";
    retorno += "local: " + local + " / ";
    retorno += "autor: " + autor.nomeCompleto() + " / ";
      return retorno;
  }

}
