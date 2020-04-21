
import 'package:flutter/material.dart';
import 'package:huellitasdigitales_moviles/src/pages/principal_page.dart';

String _lookU = "yonathan";
String _lookP = "tu90mama";
String _user = "";
String _password = "";

bool logueado;

class DataH {
  String paramU;
  String paramC;
  String paramN;
  DataH({this.paramU, this.paramC, this.paramN});
}

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
                  cajitas(context),
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

  Widget cajitas(BuildContext context){
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
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0)
          ),
          onChanged: (valor){
            _user = valor;
          },
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
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0)
          ),
          onChanged: (valor){
            _password = valor;
          },
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
            /*print(_user);
            print(_password);*/
            
            if (_lookU.compareTo(_user) == 0 && _lookP.compareTo(_password) ==  0) {
              final datah = DataH(
                paramU: _user,
                paramC: "ede96yona@gmail.com" //Parametro establecido por defecto
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrincipalPage(datah:datah)),
              );
              _user = "";
              _password = "";
            }else if(_user == null && _password != null){
              _alertavacia(context);
            }else if(_user != null && _password == null){
               _alertavacia(context);
            }else if(_user.isNotEmpty && _password.isEmpty){
              _alertavacia(context);
            }else if(_user.isEmpty && _password.isNotEmpty){
               _alertavacia(context);
            }else{
              _alertaerrordata(context);
            }
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
/*Alertas para el logueo */
  void _alertavacia(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("No puedes dejar campos vacios"),
          content:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Has dejado un campo vacio, debes llenar usuario y contraseña para poder iniciar"),
                Icon(Icons.warning, size: 50,),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: 
                Text("Ok", style: TextStyle(fontSize: 20),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
        );
      }
    );
  }
  void _alertaerrordata(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Error de datos"),
          content:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("comprueba que los datos que has ingresado sean los correctos, recuerda que no puedes dejar espacios"),
                Icon(Icons.warning, size: 50,),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: 
                Text("Ok", style: TextStyle(fontSize: 20),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
        );
      }
    );
  }
}

/*====================================================Clase para agregar nuevo usuario===========================================================*/
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
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Nombre completo',
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0)
          ),
          onChanged: (valor){
            
          },
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
        SizedBox(height: 5),
        Text("San Miguel, El Salvador, Todos los derechos reservados.", style: TextStyle(fontSize: 13),),
        Text("© Huellitas Digitales, 2020", style: TextStyle(fontSize: 13),),
        SizedBox(height: 2),
      ]
    );
  }
}