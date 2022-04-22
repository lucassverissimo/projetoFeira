import 'package:flutter/material.dart';
import '../mocks/mock_feira.dart';
import '../models/feira_model.dart';
import 'components/Linha_lista_feira.dart';
import 'components/My_textformfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<FeiraModel> feirasLista = MockFeira.getListaFeira();

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
        child: Column(            
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(sufix: new Icon(Icons.search,color: new Color(0xff5454D9), size: 20,)),
                ),
              ],
            ),
            for (var item in feirasLista) Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: LinhaListaFeira(feiraModel: item,),
            )
            ],
        ),
      ),
    );
  }
}
