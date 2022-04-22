import 'package:flutter/material.dart';

import '../../models/feira_model.dart';

class LinhaListaFeira extends StatelessWidget {
  final FeiraModel feiraModel;

  const LinhaListaFeira({Key? key, required this.feiraModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
