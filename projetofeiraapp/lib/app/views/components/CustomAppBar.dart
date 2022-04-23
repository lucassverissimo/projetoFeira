
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget  {
  @override
  final Size preferredSize;

  
  CustomAppBar(
        { Key? key,}) : preferredSize = Size.fromHeight(kToolbarHeight),
            super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: Image.asset(
      'assets/images/logo.png',
      width: 250,
      height: 230,
    ),
    centerTitle: true,
    backgroundColor: new Color(0xff8867F2),
    );
  }
}
