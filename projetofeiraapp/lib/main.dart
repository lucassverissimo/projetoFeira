import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/views/pages/AdicionarFeiraPage.dart';
import 'app/views/pages/HomePage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.deepPurple,
      ),

      initialRoute: '/',
          routes: {
            '/':(context) => HomePage(),
            '/feira/novo':(context) => AdicionarFeiraPage(),
          },
    );
  }
}
