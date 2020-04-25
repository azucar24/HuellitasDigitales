import 'package:flutter/cupertino.dart';
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
        title: new Text('Huellita Digital, El Salvador.',style: TextStyle(fontSize: 25)),  
        backgroundColor: Colors.cyan[700],      
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new Container(
              child: 
                new UserAccountsDrawerHeader(
                  accountName : new Text('Usuario $name',style: TextStyle(fontSize: 25)), 
                  accountEmail: new Text('Correo $correo',style: TextStyle(fontSize: 20)),
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
              title: new Text('Mis Reservaciones.',style: TextStyle(fontSize: 25)),
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
                  Text("My Acount", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                  Image(image:AssetImage("assets/images/pp.jpg"), width:300,height:300),                  
                  Divider(),
                 CupertinoButton(
                  child: Text('Actualizar.', style: TextStyle(fontSize: 25),),
                  color: Colors.blueGrey,
                   onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateDataUser()),
                    );
                   },
                  ),
                   Divider(),
                   CupertinoButton(
                  child: Text('Eliminar.', style: TextStyle(fontSize: 25),),
                  color: Colors.redAccent,
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