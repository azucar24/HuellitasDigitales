import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:huellitasdigitales_moviles/src/pages/myacount_page.dart';
import 'package:huellitasdigitales_moviles/src/pages/principal_page.dart';
import 'package:huellitasdigitales_moviles/src/pages/reservar.dart';

import 'home_page.dart';

class DataP {
  String paramU;
  String paramC;
  String paramN;
  DataP({this.paramU, this.paramC, this.paramN});
}

String name = "";
String correo = "";

class MyReservations extends StatelessWidget {
  /*Recibir parametros del home */

  @override
  Widget build(BuildContext context) {
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
            title:
                new Text('Nueva Reservacion.', style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.list),
            onTap: () {
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
            title:
                new Text('Nueva Reservacion.', style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.add_comment),
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
                "Mis Reservaciones",
                style: TextStyle(fontSize: 30),
              ),
              Divider(),
              listarreservacions(),
              Divider(),

              Divider(),
              CupertinoButton(
                child: Text('Reservar mi boleto +',
                    style: TextStyle(fontSize: 25)),
                color: Colors.cyan[600],
                
                onPressed: () {},
                
              ),

         
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

  Widget listarreservacions() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Fecha')),
        DataColumn(label: Text('Hora')),
        DataColumn(label: Text('Opciones')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Salvador Azucar')),
          DataCell(Text('20/12/2020')),
          DataCell(Text('2:00 pm')),
          DataCell(IconButton(icon: Icon(Icons.delete)))
        ]),
      ],
    );
  }
}
