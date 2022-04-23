import 'package:flutter/material.dart';

import '../components/CustomAppBar.dart';

class AdicionarFeiraPage extends StatefulWidget {
  const AdicionarFeiraPage({Key? key}) : super(key: key);

  @override
  State<AdicionarFeiraPage> createState() => _AdicionarFeiraPageState();
}

class _AdicionarFeiraPageState extends State<AdicionarFeiraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(children: [
        Text('Adicionar Feira'),
      ]),
    );
  }
}

