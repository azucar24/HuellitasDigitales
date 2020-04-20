import 'package:flutter/material.dart';
import 'package:huellitasdigitales_moviles/src/pages/principal_page.dart';

import 'home_page.dart';

class MyAcount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Huellita Digital, El Salvador.'),  
        backgroundColor: Colors.blueGrey,      
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new Container(
              child: 
                new UserAccountsDrawerHeader(
                  accountName : new Text('Usuario'), 
                  accountEmail: new Text('Correo'),
                  currentAccountPicture: new CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
                ),
              color: Colors.blueGrey
            ),

            new ListTile(
              title: new Text('Inicio.'),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => PrincipalPage()),
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
             new ListTile(
              title: new Text('My Reservaciones.'),
              leading: Icon(Icons.list),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
             new Divider(
              color: Colors.black,
              height: 5.0,
            ),
             new ListTile(
              title: new Text('New Reservacion.'),
              leading: Icon(Icons.add_comment),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
             new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Cerrar Sesion.'),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ]
        )
      ),
      body: 
        ListView(
          children : <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Text("My Acount", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                  Image(image:AssetImage("assets/images/pp.jpg"), width:300,height:300),                  
                  Divider(),
                  RaisedButton(
                  child: Text('Modificar.', style: TextStyle(fontSize: 20),),
                  color: Colors.cyan,
                   onPressed: () {},
                  ),
                   Divider(),
                   RaisedButton(
                  child: Text('Eliminar.', style: TextStyle(fontSize: 20),),
                  color: Colors.cyan,
                   onPressed: () {},
                  ),
                  SizedBox(height: 5),
                  Text("San Miguel, El Salvador, Todos los derechos reservados.", style: TextStyle(fontSize: 13),),
                  Text("© Huellitas Digitales, 2020", style: TextStyle(fontSize: 13),),
                  SizedBox(height: 2),
                ],
              ) 
            )
          ]
        )
    );
  }
  
}