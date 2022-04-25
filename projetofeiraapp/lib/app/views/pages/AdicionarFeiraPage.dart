import 'package:flutter/material.dart';
import 'package:projetofeiraapp/app/models/FeiraModel.dart';

import '../components/CustomAppBar.dart';

class AdicionarFeiraPage extends StatefulWidget {
  
  late FeiraModel feiraModel;

  AdicionarFeiraPage({Key? key, FeiraModel? feiraModel}) : super(key: key);

  @override
  State<AdicionarFeiraPage> createState() => _AdicionarFeiraPageState(feiraModel);
}

class _AdicionarFeiraPageState extends State<AdicionarFeiraPage> {
  _AdicionarFeiraPageState(FeiraModel feira);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: TextField(     
                                     
              decoration: InputDecoration(
                labelText: 'Título',
                
              ),
            ),
          ),
          SizedBox(width: 4,),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Data',
              ),
            )
          
          )
        ]),
      ),
    );
  }
}

