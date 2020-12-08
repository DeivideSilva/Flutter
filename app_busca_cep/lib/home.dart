import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtcep = new TextEditingController();
  String resultado;

  _consultarCep() async {
    String cep = txtcep.text;
    String url = 'https://viacep.com.br/ws/$cep/json';

    http.Response response;
    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String cidade = retorno["localidade"];

    setState(() {
      resultado = "$logradouro, $bairro, $cidade";
    });
  }

  _limparCampos() {
    setState(() {
      resultado = '';
      txtcep.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Cep'),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite o cep Ex:00000000'),
              controller: txtcep,
            ),
            Divider(),
            Text(
              'Resultado: $resultado',
              style: TextStyle(fontSize: 20.0),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: _consultarCep,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text(
                    'Buscar',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                RaisedButton(
                    onPressed: _limparCampos,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      'Limpar',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
