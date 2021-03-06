import 'package:flutter/material.dart';
import 'package:app_cadastro/utils/ContatoHelpers.dart';

import 'model/Contato.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtnome = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txttelefone = TextEditingController();
  List<Contato> listadeContatos = List<Contato>();

  final _formkey = GlobalKey<FormState>();

  ContatoHelpers _db = ContatoHelpers();

  void salvarContato({Contato contatoSelecionado}) {
    setState(() async {
      if (contatoSelecionado == null) {
        Contato obj = Contato(txtnome.text, txtemail.text, txttelefone.text);

        int resultado = await _db.inserirContato(obj);

        if (resultado != null) {
          print('Cadastrado com sucesso!!!' + resultado.toString());
        } else {
          print('Erro ao cadastrar!');
        }
      } 
      else {
        contatoSelecionado.nome = txtnome.text;
        contatoSelecionado.email = txtemail.text;
        contatoSelecionado.telefone = txttelefone.text;

        int resultado = await _db.alterarContato(contatoSelecionado);

        if (resultado != null) {
          print('Dados alterados com sucesso!' + resultado.toString());
        } else {
          print('Erro ao Alterar!');
        }

      }
      
      limparCampos();
      recuperarContatos();

    });
  }

  void limparCampos(){
      txtnome.clear();
      txtemail.clear();
      txttelefone.clear();
  }

  void recuperarContatos() async {
    List contatosRecuperados = await _db.listarContatos();

    List<Contato> listatemporaria = List<Contato>();

    for (var item in contatosRecuperados) {
      Contato c = Contato.deMapParaModel(item);
      listatemporaria.add(c);
    }

    setState(() {
      listadeContatos = listatemporaria;
    });

    listatemporaria = null;
  }

  void removerContato(int id)async{
      int resultado = await _db.excluirContato(id);

      recuperarContatos();

  }

  void exibirTelaConfirma(int id){
    showDialog(
      context: context,
      builder:(context){
        return AlertDialog(
          title:Text('Excluir contato'),
          content: Text('Deseja realmente excluir o contato?'),
          backgroundColor: Colors.white,
          actions: [
            RaisedButton(
              color:Colors.red,
              child: Text('Cancelar',style:TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(context);
              },
            ),

            RaisedButton(
              color:Colors.red,
              child: Text('Excluir',style: TextStyle(color: Colors.white),),
              onPressed: (){
                removerContato(id);
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  void exibirTelaCadastro({Contato contato}) {
    String textoTitulo = '';
    String textobotao = '';

    if (contato == null) {
      textoTitulo = 'Adicionar um Contato';
      textobotao = 'Salvar';
    } else {
      textoTitulo = 'Editar Contato';
      textobotao = 'Editar';

      txtnome.text = contato.nome;
      txtemail.text = contato.email;
      txttelefone.text = contato.telefone;
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('$textoTitulo'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    /*validator:(value){
                      if(value.isEmpty) return 'O campo é obrigatorio!';
                      return null;
                    },*/
                    controller: txtnome,
                    autofocus: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nome',
                      hintText: 'Digite seu nome',
                    ),
                  ),
                  TextField(
                    /*validator:(value){
                      if(value.isEmpty)return 'O campo é obrigatorio!';
                      return null;
                    },*/
                    controller: txtemail,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: 'E-mail',
                      hintText: 'Digite seu email',
                    ),
                  ),
                  TextField(
                    /*validator: (value){
                      if(value.isEmpty) return 'O campo é obrigatorio!';
                      return null; 
                    },*/
                    controller: txttelefone,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: 'Telefone',
                      hintText: 'Digite o seu telefone',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                child: Text('$textobotao'),
                onPressed: () {
                  /*if(_formkey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content:Text('Dados salvos com sucesso!!!'),
                      ));*/
                  
                  salvarContato(contatoSelecionado: contato);
                  Navigator.pop(context);
                  
                },
              ),
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  limparCampos();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    recuperarContatos();
  }

  @override
  Widget build(BuildContext context) {
    recuperarContatos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de usuarios'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listadeContatos.length,
              itemBuilder: (context, index) {
                final Contato obj = listadeContatos[index];

                return Card(
                  child: ListTile(
                    title: Text(obj.nome),
                    subtitle: Text(obj.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            exibirTelaCadastro(contato: obj);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.edit, color: Colors.yellowAccent),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            exibirTelaConfirma(obj.id);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.delete, color: Colors.red[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
