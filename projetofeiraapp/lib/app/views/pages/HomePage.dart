import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

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
  List<FeiraModel> feirasLista = MockFeira.getListaFeira();
  @override
  Widget build(BuildContext context) {

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
              FocusedMenuHolder(

                onPressed: (){},
                menuItems: <FocusedMenuItem>[
                  FocusedMenuItem(title: Text('Alterar'), onPressed: (){}, trailingIcon: Icon(Icons.edit)),
                  FocusedMenuItem(title: Text('Copiar'), onPressed: (){}, trailingIcon: Icon(Icons.copy)),                  
                  FocusedMenuItem(title: Text('Ver perfil de ' + item.autor.nome ), onPressed: (){}, trailingIcon: Icon(Icons.person)),
                    FocusedMenuItem(
                      title: Text(
                        'Remover', 
                        style: TextStyle(color: Colors.white,)
                      ), 
                    onPressed: (){
                      if(item.titulo == "Casa"){
                        // confirmar a remoção
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // retorna um objeto do tipo Dialog
                            return AlertaRemoverItem(item);
                          },
                        );
                      }
                    }, 
                    trailingIcon: Icon(Icons.delete, color: Colors.white,),
                    backgroundColor: item.titulo == "Casa" ? Colors.red : Colors.grey,
                    ),
                ],
                child: Container(
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

  AlertDialog AlertaRemoverItem(FeiraModel item) {
    return AlertDialog(
                  title: Center(child: Text('Remover Feira')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Tem certeza que deseja remover a feira " + item.titulo + " ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: new Color(0xff8867F2),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(                              
                              child: Text('Sim'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          ElevatedButton(
                              child: Text('Não'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ])
                    ],
                  ),
                );
  }
}
