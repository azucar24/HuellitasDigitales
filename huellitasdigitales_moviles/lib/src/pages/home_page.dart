
import 'package:flutter/material.dart';
import 'package:huellitasdigitales_moviles/src/pages/principal_page.dart';

String _user = "yonathan";
String _password = "tu90mama";

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Huellita Digital, El Salvador"),
        backgroundColor: Colors.blueGrey,
      ),
      body: 
        ListView(
          children : <Widget>[
                Center(
              child: Column(
                children: <Widget>[
                  Image(image:AssetImage("assets/images/pp.jpg"), width:300,height:300),
                  Text("Ingresa tus datos:", style: TextStyle(fontSize: 30),),
                  Divider(),
                  cajitas(),
                  botones(context),
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

Widget cajitas(){
  return Column(
    children: <Widget>[
      TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        keyboardType: TextInputType.multiline,
        maxLines: 1,
        maxLength: 15,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Ingresa tu usuario',
        ),
      ),
      SizedBox(width: 50),
      TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        keyboardType: TextInputType.multiline,
        maxLines: 1,
        maxLength: 15,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.vpn_key),
          labelText: 'Ingresa tu contraseña',
        ),
      )
    ],
  );
}

Widget botones(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      RaisedButton(
        child: Text('Entrar', style: TextStyle(fontSize: 20),),
        color: Colors.cyan,
        onPressed: () {
          // Navega a la segunda ruta cuando se pulsa.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrincipalPage()),
          );
        },
      ),
      SizedBox(width: 50),
      RaisedButton(
        child: Text('Registrarse', style: TextStyle(fontSize: 20),),
        onPressed: () {
          // Navega a la segunda ruta cuando se pulsa.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserAdd()),
          );
        },
      ),
    ]
  );
}

class UserAdd extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Huellita Digital, El Salvador"),
        backgroundColor: Colors.blueGrey,
      ),
      body: 
        ListView(
          children: <Widget>[
            Center(
            child: Column(
              children: <Widget>[
                Image(image:AssetImage("assets/images/pp.jpg"), width:150,height:150),
                Text("Registra tus datos", style: TextStyle(fontSize: 35),),
                cajas()
              ],
            ) 
          )
          ],
        )
    );
  }

  Widget cajas() {
     return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.multiline,
          maxLines: 1,
          maxLength: 50,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Nombre completo',
          ),
        ),
        SizedBox(width: 50),
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          maxLength: 25,
          decoration: InputDecoration(
            icon: Icon(Icons.mail),
            labelText: 'Correo electronico',
          ),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.multiline,
          maxLines: 1,
          maxLength: 15,
          decoration: InputDecoration(
            icon: Icon(Icons.verified_user),
            labelText: 'Nombre de usuario',
          ),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.multiline,
          maxLines: 1,
          maxLength: 15,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.vpn_key),
            labelText: 'Contraseña',
          ),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.number,
          maxLines: 1,
          maxLength: 8,
          decoration: InputDecoration(
            icon: Icon(Icons.phone_android),
            labelText: 'Telefono',
          ),
        ),
        RaisedButton(
          child: Text('Guardar', style: TextStyle(fontSize: 20),),
          color: Colors.cyan,
          onPressed: () {
            // Navega a la segunda ruta cuando se pulsa.
            
          },
        ),
        SizedBox(height: 5),
        Text("San Miguel, El Salvador, Todos los derechos reservados.", style: TextStyle(fontSize: 13),),
        Text("© Huellitas Digitales, 2020", style: TextStyle(fontSize: 13),),
        SizedBox(height: 2),
      ]
    );
  }
}