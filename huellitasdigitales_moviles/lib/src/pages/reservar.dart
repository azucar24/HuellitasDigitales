import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitasdigitales_moviles/src/pages/myacount_page.dart';
import 'package:huellitasdigitales_moviles/src/pages/principal_page.dart';
import 'home_page.dart';

class Datanewreserv {
  String paramU;
  String paramC;
  String paramN;
  Datanewreserv({this.paramU, this.paramC, this.paramN});
}

String name = "";
String correo = "";

class Reservations extends StatelessWidget {
  /*Recibir parametros de la principal*/
   final DataP datap;
  Reservations({this.datap});

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
          title: new Text('Huellita Digital, El Salvador.',
              style: TextStyle(fontSize: 25)),
          backgroundColor: Colors.cyan[700],
        ),
        drawer: new Drawer(
            child: ListView(children: <Widget>[
          datosHeader(context), //Llamamos la cabecera del menu desplegable
          new ListTile(
            title: new Text('Inicio',style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.home),
            onTap: (){
              /*print(name);
              print(correo);*/
                
              final datanewreserv = Datanewreserv(
                paramU: name,
                paramC: correo 
              );
              Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => PrincipalPage(datanewreserv:datanewreserv)),
              );
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5.0,
          ),
          new ListTile(
            title:
                new Text('Mis Reservaciones.', style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reservations()),
              );
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5.0,
          ),

          new ListTile(
            title: new Text('My Acount.', style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.person),
            onTap: () {
              /*print(name);
                print(correo);*/

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAcount()),
              );
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5.0,
          ),
          new ListTile(
            title: new Text('Cerrar Sesion.', style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ])),
        body: ListView(children: <Widget>[
          Center(
              child: Column(
            children: <Widget>[
              Text(
                "Nueva Reservacion",
                style: TextStyle(fontSize: 30),
              ),
              Divider(),
              reservar(),
              Divider(),
            
              Divider(),
              SizedBox(height: 5),
              Text(
                "San Miguel, El Salvador, Todos los derechos reservados.",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "© Huellitas Digitales, 2020",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 2),
            ],
          ))
        ]));
  }

  Widget datosHeader(BuildContext context) {
    if (name != null) {
      return new Container(
          child: new UserAccountsDrawerHeader(
            accountName: new Text('Us: $name', style: TextStyle(fontSize: 25)),
            accountEmail: new Text('Correo $correo'),
            currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage("assets/images/pp.jpg")),
          ),
          color: Colors.black45);
    } else {
      return new Container(
          child: new UserAccountsDrawerHeader(
            accountName: new Text('Usuario vacios'),
            accountEmail: new Text('Correo vacios'),
            currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage("assets/images/pp.jpg")),
          ),
          color: Colors.blueGrey);
    }
  }

  Widget reservar() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      
      SizedBox(width: 50),
   
     
      CupertinoButton(
        child: Text(
          'Verificar',
          style: TextStyle(fontSize: 20),
        ),
        color: Colors.cyan[700],
        onPressed: () {
          // Navega a la segunda ruta cuando se pulsa.
        },
      ),
    ]);
  }
}
