import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Usertile extends StatelessWidget {

final User user;

const Usertile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar =  user.avatarUrl == null || user.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading:avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child:Row(
          children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          color:Colors.yellow,
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.USER_FORM,
              arguments: user,
            );
          } ,
          ),
        IconButton(
          icon: Icon(Icons.delete),
          color:Colors.red,
          onPressed:() {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title:  Text('Excluir Usuário'),
                content: Text('Deseja realmente excluir?'),
                actions:<Widget>[
                  FlatButton(
                    child: Text('Não'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    
                  ),
                   FlatButton(
                     child: Text('Sim'),
                     onPressed: () {
                       Provider.of<Users>(context, listen: false).remove(user);
                       Navigator.of(context).pop();
                     },
                     
                   ),
                ],
               ),
              );
            
          } ,
          ),
      ],
      ),
      )
    );
  }
}

