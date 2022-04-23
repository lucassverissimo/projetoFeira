import 'package:flutter/material.dart';

import '../../models/FeiraModel.dart';

class LinhaListaFeira extends StatelessWidget {
  final FeiraModel feiraModel;

  const LinhaListaFeira({Key? key, required this.feiraModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        feiraModel.titulo,
                        //textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xff5454D9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          feiraModel.data,
                          textAlign: TextAlign.right,                        
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xff717F7F),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        feiraModel.itens.length.toString() +
                            (feiraModel.itens.length > 1 ? " Itens" : " Item"),
                        //textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xff717F7F),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Criado por ",
                        //textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xff717F7F),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        feiraModel.autor.nome,
                        //textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xff4B92F2),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      ),                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
