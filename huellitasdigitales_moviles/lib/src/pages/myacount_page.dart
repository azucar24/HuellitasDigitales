import 'package:flutter/material.dart';

class MyAcount extends StatelessWidget {
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