import 'package:flutter/material.dart';

class TelaSoma extends StatefulWidget {
  @override
  _TelaSomaState createState() => _TelaSomaState();
}

class _TelaSomaState extends State<TelaSoma> {
  TextEditingController txtv1 = new TextEditingController();
  TextEditingController txtv2 = new TextEditingController();
  int v1, v2, total = 0;

  void CalcularTotal() {
    setState(() {
      v1 = int.parse(txtv1.text);
      v2 = int.parse(txtv2.text);
      total = v1 + v2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto soma'),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: txtv1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Informe um número", enabled: true),
            ),

            TextField(
              controller: txtv2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Informe outro número"),
            ),

            Text(
              'O total é: $total ',
              style: TextStyle(fontSize: 25),
            ),
            
             RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: CalcularTotal,
              color: Colors.blue,
              child: Text(
                "Calcular",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
             
          ],
        ),
       
       
        
      ),
    );
  }
}
