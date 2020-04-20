import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text('Huellita Digital, El Salvador.'),        
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Usuario'), 
              accountEmail: new Text('Correo'),
              currentAccountPicture: new CircleAvatar(),
            ),
            new ListTile(
              title: new Text('Inicio.'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
             new ListTile(
              title: new Text('My Reservaciones.'),
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
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
             new Divider(
              color: Colors.black,
              height: 5.0,
            ),
             new ListTile(
              title: new Text('My Acount.'),
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
              onTap: (){
                Navigator.of(context).pop();
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
                  Image(image:AssetImage("assets/images/pp.jpg"), width:300,height:300),
                  Text("Bienvenid@ a Huellita Digital", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                  Divider(),
                  RaisedButton(
                  child: Text('Reservación', style: TextStyle(fontSize: 20),),
                  color: Colors.lightGreen,
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