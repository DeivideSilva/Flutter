class Contato{

  int _id;
  String _nome;
  String _email;
  String _telefone;
  
 int get id => _id;

 set id(int value) => _id = value;

 String get nome => _nome;

 set nome(String value) => _nome = value;

 String get email => _email;

 set email(String value) => _email = value;

 String get telefone => _telefone;

 set telefone(String value) => _telefone = value;

  Contato(this._id, this._nome, this._email,this._telefone);

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