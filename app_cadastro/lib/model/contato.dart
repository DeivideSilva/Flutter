class Contato{

  int _id;
  String _nome;
  String _email;
  String _telefone;

  Contato(this._nome, this._email,this._telefone);
  
 // ignore: unnecessary_getters_setters
 int get id => _id;

 // ignore: unnecessary_getters_setters
 set id(int value) => _id = value;

 // ignore: unnecessary_getters_setters
 String get nome => _nome;

 // ignore: unnecessary_getters_setters
 set nome(String value) => _nome = value;

 // ignore: unnecessary_getters_setters
 String get email => _email;

 // ignore: unnecessary_getters_setters
 set email(String value) => _email = value;

 // ignore: unnecessary_getters_setters
 String get telefone => _telefone;

 // ignore: unnecessary_getters_setters
 set telefone(String value) => _telefone = value;

  

  //Metodo para converter de model para Map
  Map<String, dynamic>toMap(){
    var dados = Map<String, dynamic>();
    dados['id'] = _id;
    dados['nome'] = _nome;
    dados['email'] = _email;
    dados['telefone'] = _telefone;
    return dados;
  }

  //Metodo para converter de Map para model
  Contato.deMapParaModel(Map<String,dynamic>dados)
  {
    this._id = dados['id'];
    this._nome = dados['nome'];
    this._email = dados['email'];
    this._telefone = dados['telefone'];
  }
}