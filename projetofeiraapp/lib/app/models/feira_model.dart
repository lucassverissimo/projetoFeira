import 'package:projetofeiraapp/app/models/perfil_model.dart';

import 'feira_item_model.dart';

class FeiraModel {
  late String titulo;
  late String data;
  late PerfilModel autor;
  late List<PerfilModel> participantes;
  late List<FeiraItemModel> itens;
  FeiraModel();
}
