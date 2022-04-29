import 'package:projetofeiraapp/app/models/PerfilModel.dart';

import 'FeiraItemModel.dart';

class FeiraModel {
  late String id;
  late String titulo;
  late String data;
  late PerfilModel autor;
  late List<PerfilModel> participantes;
  late List<FeiraItemModel> itens = <FeiraItemModel>[];
  FeiraModel();
}
