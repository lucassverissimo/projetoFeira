import 'package:flutter/material.dart';
import 'package:projetofeiraapp/app/models/FeiraModel.dart';
import 'package:intl/intl.dart' as intl;

import '../components/CustomAppBar.dart';

class AdicionarFeiraPage extends StatefulWidget {
  
  late FeiraModel feiraModel= new FeiraModel();

  AdicionarFeiraPage({Key? key, FeiraModel? feiraModel}) : super(key: key);

  @override
  State<AdicionarFeiraPage> createState() => _AdicionarFeiraPageState(feiraModel);
}

class _AdicionarFeiraPageState extends State<AdicionarFeiraPage> {
  _AdicionarFeiraPageState(FeiraModel feira);
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String descricao = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Título da feira',
                            labelText: 'Título',
                          ),
                          onChanged: (value) {
                            setState(() {
                              title = value;
                            });
                          },
                        ),
                        _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              date = value;
                            });
                          },
                        ),
                        
                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),          
        ),
      ),
      floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [          
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              
                        // confirmar a remoção
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // retorna um objeto do tipo Dialog
                            return AlertaInserirItem();
                          },
                        );
                                
            },
            heroTag: null,
          )
        ])
    );
  }
  AlertDialog AlertaInserirItem() {
    return AlertDialog(
                  title: Center(child: Text('Inserir Feira')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Título: " + title + " \n Date: " + intl.DateFormat('dd/MM/yyyy').format(date),
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

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Data',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat('dd/MM/yyyy').format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        TextButton(
          child: const Text('Editar'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
