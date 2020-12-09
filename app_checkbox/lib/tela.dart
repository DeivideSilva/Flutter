import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  TextEditingController txtpreco = TextEditingController();
  double valor;

  bool ckborda = false;
  bool ckrefri = false;

  calcularTotal() {
    setState(() {
      double preco;

      preco = double.parse(txtpreco.text);
      //Verifica se o usuario escolheu borda ou refrigerante
      if (ckborda == true && ckrefri == true) {
        preco += 6.50;
      } else if (ckborda == true) {
        preco += 4;
      } else if (ckrefri == true) {
        preco += 2.50;
      }

      valor = preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de checkbox'),
        backgroundColor: Colors.purple[300],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TextField(
                style:
                    TextStyle(fontSize: 20.0, height: 2.0, color: Colors.black),
                controller: txtpreco,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Digite o preço da Pizza',
                  enabled: true,
                ),
              ),
              Divider(),
              Text(
                'Total a pagar: $valor',
                style: TextStyle(fontSize: 25.0, color: Colors.blue),
              ),
              CheckboxListTile(
                title: Text(
                  'Borda recheada - R\$ 4,00',
                  style: TextStyle(fontSize: 15.0),
                ),
                subtitle: Text(
                  'Adicione  borda ao seu pedido',
                  style: TextStyle(fontSize: 14.0),
                ),
                activeColor: Colors.green,
                secondary: Icon(Icons.shopping_cart, color: Colors.red[300]),
                value: ckborda,
                onChanged: (bool valor) {
                  setState(() {
                    ckborda = valor;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Refrigerante - R\$ 2,50',
                  style: TextStyle(fontSize: 15.0),
                ),
                subtitle: Text(
                  'Adicione um refrigerante ao seu pedido',
                  style: TextStyle(fontSize: 14.0),
                ),
                activeColor: Colors.green,
                secondary: Icon(Icons.shopping_cart, color: Colors.red[300]),
                value: ckrefri,
                onChanged: (bool valor) {
                  setState(() {
                    ckrefri = valor;
                  });
                },
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: calcularTotal,
                color: Colors.green,
                child: Text(
                  'Calcular Total',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
