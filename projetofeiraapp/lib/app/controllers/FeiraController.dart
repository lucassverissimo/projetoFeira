import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/FeiraModel.dart';
import '../models/PerfilModel.dart';
import '../models/ProdutoFeiraModel.dart';

class FeiraController {
  Future<FeiraModel> FeiraFetch() async {
    var url = 'https://localhost:6001/api/Feira/';
    var id = '6271f718a97f64e00ac3c733';
    //Uri urlF =
    var response = await http.get(Uri.parse(url + id));
    var json = jsonDecode(response.body);
    FeiraModel feiraModel = new FeiraModel();
    feiraModel.id = json["id"];
    feiraModel.data = json["data"];
    feiraModel.titulo = json["titulo"];
    feiraModel.local = json["local"];
    feiraModel.autor = await montaPerfil(json["autor"]);
    feiraModel.itens = <ProdutoFeiraModel>[];

    return feiraModel;
  }

  PerfilModel montaPerfil(json) {
    PerfilModel perfil = new PerfilModel();
    perfil.id = json["id"];
    perfil.nome = json["nome"];
    perfil.sobrenome = json["sobrenome"];
    perfil.avatar = json["avatar"];
    return perfil;
  }
}
