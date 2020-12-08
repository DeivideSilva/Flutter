import 'package:flutter/material.dart';

import 'telaSoma.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:TelaSoma(),
  ));
}






//Trabalhando com linhas e colunas(Row and Column)
/*void main() {
  runApp(MaterialApp(
    home: TelaColuna(),
  ));
}

class TelaColuna extends StatefulWidget {
  @override
  _TelaColunaState createState() => _TelaColunaState();
}

class _TelaColunaState extends State<TelaColuna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de coluna'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              'Texto1',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              'Texto2',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              'Texto3',
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
*/