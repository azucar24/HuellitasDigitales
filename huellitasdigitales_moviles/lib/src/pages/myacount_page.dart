import 'package:flutter/material.dart';

import 'package:huellitasdigitales_moviles/src/pages/principal_page.dart';
import 'package:huellitasdigitales_moviles/src/pages/updatedatauser_page.dart';
import 'home_page.dart';

class DataMyac {
  String paramU;
  String paramC;
  String paramN;
  DataMyac({this.paramU, this.paramC, this.paramN});
}

String name = "";
String correo = "";

class MyAcount extends StatelessWidget {
  /*Recibir parametros de la principal*/
  final DataP datap;
  MyAcount({this.datap});

  @override
  Widget build(BuildContext context) {
    if(this.datap.paramU != null){
      name = this.datap.paramU;
      correo = this.datap.paramC;
    }else if(this.datap.paramU != null){
      name = this.datap.paramU;
      correo = this.datap.paramC;
    }else{
      name = "Nada";
      correo = "Nada";
    }

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
                  accountName : new Text('Usuario $name'), 
                  accountEmail: new Text('Correo $correo'),
                  currentAccountPicture: new CircleAvatar(backgroundImage: AssetImage("assets/images/pp.jpg")),
                ),
              color: Colors.blueGrey
            ),

            new ListTile(
              title: new Text('Inicio'),
              leading: Icon(Icons.home),
              onTap: (){
                /*print(name);
                print(correo);*/
                
                final datamyac = DataMyac(
                  paramU: name,
                  paramC: correo 
                );
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => PrincipalPage(datamyac:datamyac)),
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
                   onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateDataUser()),
                    );
                   },
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