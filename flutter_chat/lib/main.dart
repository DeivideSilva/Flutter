//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

void main() async{
  runApp(MyApp());

   /*Firestore.instance.collection('mensagens').snapshots().listen((dado) {
     dado.documents.forEach((d) {
       print(d.data);
     });
   });*/
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color:Colors.blue,
        ),
      ),
      home: ChatScreen(),
    );
  }
}