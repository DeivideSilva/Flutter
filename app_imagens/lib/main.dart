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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabalhando com imagens'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Imagem da Internet',
              style: TextStyle(fontSize: 20.0),
            ),
            Divider(),
            Image.network(
                'https://cdn.pixabay.com/photo/2012/04/13/01/23/moon-31665__340.png'),
            Text(
              'Imagem do projeto',
              style: TextStyle(fontSize: 20.0),
            ),
            Divider(),
            Image.asset('imagens/papagaio.jpg'),
            Divider(),
            Text(
              'Imagem da Internet',
              style: TextStyle(fontSize: 20.0),
            ),
            Image.network(
                'https://cdn.pixabay.com/photo/2020/09/24/17/59/aurora-5599375__340.jpg'),
            Text(
              'Imagem do projeto',
              style: TextStyle(fontSize: 20.0),
            ),
            Image.asset('imagens/rio.jpg'),
          ],
        ),
      ),
    );
  }
}
