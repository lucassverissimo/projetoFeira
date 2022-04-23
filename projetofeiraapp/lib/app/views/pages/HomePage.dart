import 'package:flutter/material.dart';

import '../../mocks/FeiraMock.dart';
import '../../models/FeiraModel.dart';
import '../components/CustomAppBar.dart';
import '../components/LinhaListaFeiraComponente.dart';
import '../components/MyTextFormFieldComponente.dart';


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
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 15, right: 15, bottom: 5),
              child: MyTextFormField(
                  sufix: new Icon(
                Icons.search,
                color: new Color(0xff5454D9),
                size: 20,
              )),
            ),
            Divider(
              thickness: 1,
              color: new Color(0xffD9D9D9),
            ),
            for (var item in feirasLista)
              Container(
                //padding: const EdgeInsets.only(top: 2.0),
                child: Column(
                  children: [
                    LinhaListaFeira(
                      feiraModel: item,
                    ),
                    Divider(
                      thickness: 1,
                      color: new Color(0xffD9D9D9),
                    ),
                  ],
                ),
              ),
              
          ],
        ),        
      ),

      floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [          
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){Navigator.of(context).pushNamed('/feira/novo');},
            heroTag: null,
          )
        ])

    );
  }
}
