import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:huellitasdigitales_moviles/src/pages/myacount_page.dart';
import 'home_page.dart';

class DataP {
  String paramU;
  String paramC;
  String paramN;
  DataP({this.paramU, this.paramC, this.paramN});
}

String name = "";
String correo = "";

class PrincipalPage extends StatelessWidget {
  
  /*Recibir parametros del home */
  final DataH datah;
  /*Recibir parametros de Myaccount */
  final DataMyac datamyac;
  
  PrincipalPage({this.datah, this.datamyac});
  

  @override
  Widget build(BuildContext context) {
    if(this.datah != null && this.datamyac == null){
      name = this.datah.paramU;
      correo = this.datah.paramC;
    }else if(this.datamyac != null && this.datah == null){
      name = this.datamyac.paramU;
      correo = this.datamyac.paramC;
    }else{
      name = "Nada";
      correo = "Nada";
    }

    return Scaffold(
      appBar: AppBar(
        title: new Text('Huellita Digital, El Salvador.', style: TextStyle(fontSize:25)),   
        backgroundColor: Colors.cyan[700],     
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            datosHeader(context), //Llamamos la cabecera del menu desplegable
              new ListTile(
              title: new Text('Mis Reservaciones.',style: TextStyle(fontSize: 20)),
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
              title: new Text('Nueva Reservacion.',style: TextStyle(fontSize: 20)),
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
              title: new Text('My Acount.',style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.person),
              onTap: (){
                /*print(name);
                print(correo);*/
                  
                final datap = DataP(
                  paramU: name,
                  paramC: correo, //Parametro que viene desde el home
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAcount(datap:datap)),
                );
                name = "";
                correo = "";
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Cerrar Sesion.',style: TextStyle(fontSize: 20)),
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
                  Image(image:AssetImage("assets/images/pp.jpg"), width:700,height:300),
                  Divider(),
                  Text("Bienvenid@ a Huellita Digital", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                  Divider(),
                  CupertinoButton(                    
                  child: Text('Reservar mi boleto +', style: TextStyle(fontSize: 25)),
                  color: Colors.cyan[600],
                  onPressed: () {},
                  ),
                  Divider(),
                  Divider(),
                  Divider(),
                  Divider(),
                  SizedBox(height: 5),
                  Text("San Miguel, El Salvador, Todos los derechos reservados.", style: TextStyle(fontSize: 15),),
                  Text("© Huellitas Digitales, 2020", style: TextStyle(fontSize: 15),),
                  SizedBox(height: 2),
                ],
              ) 
            )
          ]
        )
    );
  }
  
  Widget datosHeader(BuildContext context){
    if (name != null) {
      return 
        new Container(
          child: 
            new UserAccountsDrawerHeader(
              accountName : new Text('Us: $name',style: TextStyle(fontSize: 25)), 
              accountEmail: new Text('Correo $correo'),
              currentAccountPicture: new CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
            ),
            color: Colors.black45
        )
      ;
    }else{
      return 
        new Container(
          child: 
            new UserAccountsDrawerHeader(
              accountName : new Text('Usuario vacios'), 
              accountEmail: new Text('Correo vacios'),
              currentAccountPicture: new CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
            ),
            color: Colors.blueGrey
        )
      ;
    }
  }
}