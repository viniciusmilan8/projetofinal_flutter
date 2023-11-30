import 'package:estacionamento/screens/Home.dart';
import 'package:flutter/material.dart';

import '../screens/Create.dart';
import '../screens/Lista.dart';

Widget Menu(BuildContext context){
  return Drawer(
      child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Vinicius Milan"),
              accountEmail: Text("vini@teste.com.br"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaWTYLo3OmA4sqQclkBEGG14pk40613OGR7oQNVHWieKjcuJScHoNUYrI7B1Ts5Hs4-qE&usqp=CAU',
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text("Lista"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaPage()),
                );
              },
            ),
            ListTile(
              title: Text("Criar"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Create()),
                );
              },
            ),
          ]
      )
  );
}
