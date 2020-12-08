import 'package:flutter/material.dart';

class TelaSoma extends StatefulWidget {
  @override
  _TelaSomaState createState() => _TelaSomaState();
}

class _TelaSomaState extends State<TelaSoma> {
  TextEditingController txtv1 = new TextEditingController();
  TextEditingController txtv2 = new TextEditingController();
  int v1, v2, total = 0;
  final FocusNode myFocusNode = FocusNode();

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void calcularTotal() {
    setState(() {
      v1 = int.parse(txtv1.text);
      v2 = int.parse(txtv2.text);
      total = v1 + v2;
    });
  }

  void limpaCampos() {
    setState(() {
      txtv1.text = '';
      txtv2.text = '';
      total = 0;
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
              focusNode: myFocusNode,
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
            Divider(),
            Text(
              'O total é: $total ',
              style: TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: calcularTotal,
                  color: Colors.blue,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    limpaCampos();
                    FocusScope.of(context).requestFocus(myFocusNode);
                  },
                  color: Colors.blue,
                  child: Text(
                    "Limpar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
