import 'package:flutter/material.dart';

import '../../models/FeiraModel.dart';

class LinhaListaFeira extends StatefulWidget {
  final FeiraModel feiraModel;

  const LinhaListaFeira({Key? key, required this.feiraModel}) : super(key: key);

  @override
  State<LinhaListaFeira> createState() => _LinhaListaFeiraState();
}

class _LinhaListaFeiraState extends State<LinhaListaFeira> {
  //Color corContainer = Colors.white;
  bool enabledColor = false;  

  String _quantidadeItens(int qtd){
    if (qtd == 0){
      return "Nenhum Item";
    }
    return qtd.toString() + (widget.feiraModel.itens.length > 1 ? " Itens" : " Item");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          enabledColor = true;
        }); 
      },
      onTapUp: (TapUpDetails details){
        
        setState(() {
          enabledColor = false;
        }); 
      },      
      child: Container(
        color: (enabledColor ? Colors.white60 : Colors.transparent),
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
                          widget.feiraModel.titulo,
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
                            widget.feiraModel.data,
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
                        Text(_quantidadeItens(widget.feiraModel.itens.length),
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
                          widget.feiraModel.autor.NomeCompleto(),
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
      ),
    );
  }
}
