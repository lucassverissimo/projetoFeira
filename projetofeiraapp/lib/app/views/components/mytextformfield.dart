import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Icon? sufix;
  MyTextFormField({ required this.sufix});
    
  @override
  Widget build(BuildContext context) {
    return TextFormField (                    
                  style: TextStyle(color:new Color(0xff5454D9) ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: new Color(0xffD9D9D9),
                    labelText: 'Pesquisar',
                    labelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                  return TextStyle(color: new Color(0xffA0A0A0), letterSpacing: 1.3);
                                }),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                    contentPadding: EdgeInsets.all(8.0),
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: new Color(0xffD9D9D9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: new Color(0xffD9D9D9)),
                      borderRadius: BorderRadius.circular(50),                        
                    ),
                    suffixIcon: sufix,
                  ),
                );
  }
}
