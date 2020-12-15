import 'package:app_cadastro/model/Contato.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class ContatoHelpers {
  // Conectar com o banco de dados
  static ContatoHelpers _databasehelpers;
  static Database _database;

  ContatoHelpers._createInstance();

  factory ContatoHelpers() {
    if (_databasehelpers == null) {
      _databasehelpers = ContatoHelpers._createInstance();
    }
    return _databasehelpers;
  }

//Verifica se o banco de dados foi inicializado
  Future<Database> get database async {
    if (_database == null) {
      _database = await inicializaBanco();
    }
    return _database;
  }

  Future<Database> inicializaBanco() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String caminho = directory.path + 'bdcontatos.bd';

    var bancodedados =
        await openDatabase(caminho, version: 1, onCreate: _criaBanco);
    return bancodedados;
  }

  //Definindo a Estrutura da tabel
  String nomeTabela = 'tbl_contato';
  String colId = 'id';
  String colNome = 'nome';
  String colEmail = 'email';
  String colTelefone = 'telefone';

  //Metodo para criar a tabela contato no banco de dados
  void _criaBanco(Database db, int versao) async {
    await db.execute('CREATE TABLE  $nomeTabela('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colNome Text,'
        '$colEmail Text,'
        '$colTelefone Text)');
  }

  //Inserir Contato
  Future<int> inserirContato(Contato obj) async{

    Database db = await this.database;

    var resultado = await db.insert(nomeTabela,obj.toMap());

    return resultado;
  }

  //Metodo Listar Contatos
  listarContatos() async{

    Database db = await this.database;

    String sql = 'SELECT * FROM $nomeTabela';

    List listaContatos = await db.rawQuery(sql);

    return listaContatos;
  }

  //Metodo excluir
  Future<int> excluirContato(int id) async{
    Database db = await this.database;

    var resultado = await db.delete(nomeTabela, where: "id = ?", whereArgs: [id]);

    return resultado;
  }

  //Metodo para alterar
  Future<int> alterarContato(Contato obj) async{

  Database db = await this.database;

  var resultado =  await db.update(nomeTabela,obj.toMap(),where:"id = ?",whereArgs: [obj.id]);

  return resultado;
  }
}
