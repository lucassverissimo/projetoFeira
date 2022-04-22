import 'package:flutter/material.dart';
import '../mocks/mock_feira.dart';
import '../models/feira_model.dart';
import 'components/linhalistafeira.dart';
import 'components/mytextformfield.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(            
            children: [
              Column(
                children: [
                  MyTextFormField(sufix: new Icon(Icons.search,color: new Color(0xff5454D9), size: 20,)),
                ],
              ),
              for (var item in feirasLista) LinhaListaFeira(feiraModel: item,)
              ],
          ),
        ),
      ),
    );
  }
}
