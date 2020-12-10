import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLinks extends StatelessWidget {

Future<void> _launchLink(String url) async {

  if(await canLaunch(url)){
    await launch(url,forceWebView: false,forceSafariVC: false);
  }else{
    print('Erro ao tentar executar o link $url');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Links'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: Icon(FontAwesome.internet_explorer),
              label: Text('Link externo'),
              onPressed: () => _launchLink('http://www.terra.com.br'),
            ),
            TextButton.icon(
              icon: Icon(Icons.phone,color:Colors.green),
              label: Text('Telefone'),
              onPressed: () => _launchLink('tel:11950881271'),
            ),
            TextButton.icon(
              icon:Icon(Icons.email),
              label:Text('Email'),
              onPressed: () => _launchLink('mailto:deivide1984@hotmail.com'),
            ),
            TextButton.icon(
              icon: Icon(
                FontAwesome.youtube,
                color: Colors.redAccent[700],
              ),
              label: Text('Youtube'),
              onPressed: () => _launchLink('https://www.youtube.com'),
            ),
            TextButton.icon(
              icon: Icon(FontAwesome.github,color:Colors.black),
              label: Text('GitHub'),
              onPressed: () => _launchLink('http://github.com/DeivideSilva'),
            ),
          ],
        ),
      ),
    );
  }
}
