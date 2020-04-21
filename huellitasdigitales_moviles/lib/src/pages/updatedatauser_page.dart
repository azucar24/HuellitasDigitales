import 'package:flutter/material.dart';


class UpdateDataUser extends StatelessWidget{
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
                  Image(image:AssetImage("assets/images/pp.jpg"), width:150,height:150),
                  Text("Actualiza tus datos:", style: TextStyle(fontSize: 30),),
                  Divider(),
                  cajas(),
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
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Nombre completo',
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
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
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
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
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
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
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
          ),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.phone,
          maxLines: 1,
          maxLength: 8,
          decoration: InputDecoration(
            icon: Icon(Icons.phone_android),
            labelText: 'Telefono',
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
          ),
        ),
        RaisedButton(
          child: Text('Guardar', style: TextStyle(fontSize: 20),),
          color: Colors.cyan,
          onPressed: () {
            // Navega a la segunda ruta cuando se pulsa.
            
          },
        ),
      ]
    );
  }
}