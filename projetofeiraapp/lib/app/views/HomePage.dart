import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetofeiraapp/app/models/perfil_model.dart';

import '../models/feira_item_model.dart';
import '../models/feira_model.dart';
import 'components/mytextformfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<FeiraModel> feirasLista = MockFeira();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo_roxa.png',
          width: 250,
          height: 230,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(            
            children: [
              Column(
                children: [
                  MyTextFormField(sufix: new Icon(Icons.search,color: new Color(0xff5454D9), size: 20,)),
                ],
              ),
              for (var item in feirasLista) LinhaListaFeira(item)
              ],
          ),
        ),
      ),
    );
  }

  

  Row LinhaListaFeira(FeiraModel feiraModel) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            padding: new EdgeInsets.only(right: 13.0),
            height: 80,
            color: new Color(0xffFFFFFF), //Color.fromRGBO(136, 103, 242, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                feiraModel.titulo,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xff5454D9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<FeiraModel> MockFeira() {
    List<FeiraModel> retorno = <FeiraModel>[];
    PerfilModel lucasVerissimo = new PerfilModel();
    lucasVerissimo.nome = 'Lucas Veríssimo';
    lucasVerissimo.avatar = 'assets/images/perfil.jpg';

    PerfilModel amandaDiniz = new PerfilModel();
    amandaDiniz.nome = 'Amanda Diniz';
    amandaDiniz.avatar = 'assets/images/perfil.jpg';

    PerfilModel brunoBrito = new PerfilModel();
    brunoBrito.nome = 'Bruno Brito';
    brunoBrito.avatar = 'assets/images/perfil.jpg';

    PerfilModel michelleSantos = new PerfilModel();
    michelleSantos.nome = 'Michelle Santos';
    michelleSantos.avatar = 'assets/images/perfil.jpg';
    
    // Feira 1
    FeiraModel feira1 = new FeiraModel();
    feira1.titulo = 'Churrasco casa de Felipe';
    feira1.autor = lucasVerissimo;
    feira1.data = '23/04/2022';

    List<FeiraItemModel> itensFeira1 = <FeiraItemModel>[];
    // item 1
    FeiraItemModel item1Feira1 = new FeiraItemModel();
    item1Feira1.descricao = 'Bisteca Suína';
    item1Feira1.imagem =
        'https://images.tcdn.com.br/img/img_prod/765092/bisteca_suina_preco_por_kg_417_1_20200326153716.jpg';
    item1Feira1.quantidade = 3.0;
    item1Feira1.unidade = "kg";
    item1Feira1.valor = 8.39;
    item1Feira1.feiraModel = feira1;

    itensFeira1.add(item1Feira1);

    // item 2
    FeiraItemModel item2Feira1 = new FeiraItemModel();
    item2Feira1.descricao = 'Picanha Argentina';
    item2Feira1.imagem =
        'https://cdn.awsli.com.br/800x800/1138/1138980/produto/42495200/67b73b9405.jpg';
    item2Feira1.quantidade = 1.0;
    item2Feira1.unidade = "kg";
    item2Feira1.valor = 155.80;
    item2Feira1.feiraModel = feira1;

    itensFeira1.add(item2Feira1);

    // item 3
    FeiraItemModel item3Feira1 = new FeiraItemModel();
    item3Feira1.descricao = 'Banana';
    item3Feira1.imagem = '';
    item3Feira1.quantidade = 1.0;
    item3Feira1.unidade = "Penca";
    item3Feira1.valor = 4.75;
    item3Feira1.feiraModel = feira1;

    itensFeira1.add(item3Feira1);

    // item 4
    FeiraItemModel item4Feira1 = new FeiraItemModel();
    item4Feira1.descricao = 'Pão de Alho';
    item4Feira1.imagem =
        'https://www.bistek.com.br/media/catalog/product/cache/15b2f1f06e1cd470c80b1f3fd7ec8301/1/7/1712993_1.jpg';
    item4Feira1.quantidade = 2.0;
    item4Feira1.unidade = "pacote";
    item4Feira1.valor = 10.0;
    item4Feira1.feiraModel = feira1;
    
    itensFeira1.add(item4Feira1);
    
    feira1.itens = itensFeira1;
    retorno.add(feira1);
    
    // Feira 2
    FeiraModel feira2 = new FeiraModel();
    feira2.titulo = 'Casa';
    feira2.autor = amandaDiniz;
    feira2.data = '20/04/2022';
    retorno.add(feira2);

    // Feira 3
    FeiraModel feira3 = new FeiraModel();
    feira3.titulo = 'Mãe';    
    feira3.autor = lucasVerissimo;
    feira3.data = '19/04/2022';
    retorno.add(feira3);

    // Feira 4
    FeiraModel feira4 = new FeiraModel();
    feira4.titulo = 'cblol casa de bruno';    
    feira4.autor = brunoBrito;
    feira4.data = '21/02/2022';
    retorno.add(feira4);

    // Feira 5
    FeiraModel feira5 = new FeiraModel();
    feira5.titulo = 'Churrasco casa de felice';    
    feira5.autor = michelleSantos;
    feira5.data = '19/02/2022';
    retorno.add(feira5);

    return retorno;
  }
}
