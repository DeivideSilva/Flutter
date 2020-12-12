import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtnome = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txttelefone = TextEditingController();

  void exibirTelaCadastro() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Cadastrar novo Usuario'),
            content: SingleChildScrollView(
                          child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: txtnome,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite seu nome',
                    ),
                  ),

                  TextField(
                    controller: txtemail,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Digite seu email',
                    ),
                  ),

                  TextField(
                    controller: txttelefone,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      hintText: 'Digite o seu telefone',
                    ),
                  ),
                ],
              ),
            ),

            actions: [
              FlatButton(
                child: Text('Salvar'),
                onPressed:(){},
              ),

              FlatButton(
                child:Text('Cancelar'),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de usuarios'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          exibirTelaCadastro();
        },
      ),
    );
  }
}
