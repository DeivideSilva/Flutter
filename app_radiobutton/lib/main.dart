import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Tela(),
  ));
}

class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {

  String opEscolhida;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de uso RadioButton'),
        backgroundColor: Colors.purple[800],
      ),
      body: Container(
        child: Column(
          children: [
            RadioListTile(
              title: Text('Feminino'),
              subtitle: Text('Escolha uma opção'),
              activeColor: Colors.green,
              value: 'f',
              groupValue: opEscolhida,
              onChanged: (String valor){
               setState(() {
                  opEscolhida = valor;
               });
              },
            ),
         

           
            RadioListTile(
              title: Text('Masculino'),
              subtitle: Text('Escolha uma opção'),
              activeColor:Colors.green,
              value: 'm',
              groupValue: opEscolhida,
              onChanged: (String valor){
                setState((){
                  opEscolhida = valor;
                });
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
