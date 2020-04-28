import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:huellitasdigitales_moviles/src/pages/myacount_page.dart';
import 'package:huellitasdigitales_moviles/src/pages/principal_page.dart';
import 'package:huellitasdigitales_moviles/src/pages/reservar.dart';

import 'home_page.dart';

class DataMyre {
  String paramU;
  String paramC;
  String paramN;
  DataMyre({this.paramU, this.paramC, this.paramN});
}

String name = "";
String correo = "";

class MyReservations extends StatelessWidget {
  /*Recibir parametros de myaccount */
  final DataMyac datamyac;
  /*Recibir parametros de new reservaciones */
  final Datanewreserv datanewreserv;
  /*Recibir parametros de la principal */
  final DataP datap;
  MyReservations({this.datap, this.datanewreserv, this.datamyac});

  @override
  Widget build(BuildContext context) {
    if (this.datap != null &&
        this.datanewreserv == null &&
        this.datamyac == null) {
      name = this.datap.paramU;
      correo = this.datap.paramC;
    } else if (this.datanewreserv != null &&
        this.datap == null &&
        this.datamyac == null) {
      name = this.datanewreserv.paramU;
      correo = this.datanewreserv.paramC;
    } else if (this.datamyac != null &&
        this.datap == null &&
        this.datanewreserv == null) {
      name = this.datamyac.paramU;
      correo = this.datamyac.paramC;
    } else {
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
            title: new Text('Inicio', style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.home),
            onTap: () {
              final datamyre = DataMyre(paramU: name, paramC: correo);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PrincipalPage(datamyre: datamyre)),
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
              final datamyre = DataMyre(paramU: name, paramC: correo);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Reservations(datamyre: datamyre)),
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
              final datamyre = DataMyre(paramU: name, paramC: correo);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAcount(datamyre: datamyre)),
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
                style: TextStyle(fontSize: 20),
              ),
              Divider(),
              listarreservacions(),
              Divider(),
              Divider(),
              CupertinoButton(
                child: Text('Reservar mi boleto +',
                    style: TextStyle(fontSize: 18)),
                color: Colors.cyan[600],
                onPressed: () {
                  final datamyre = DataMyre(paramU: name, paramC: correo);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Reservations(datamyre: datamyre)),
              );
                },
              ),
              Divider(),
              SizedBox(height: 5),
              Text(
                "San Miguel, El Salvador, Todos los derechos reservados.",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "© Huellitas Digitales, 2020",
                style: TextStyle(fontSize: 12),
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
            accountName: new Text('Us: $name', style: TextStyle(fontSize: 20)),
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
    return DataTable(sortColumnIndex: 2, sortAscending: true, columns: [
      DataColumn(
        label: Text('Boletos'),
        numeric: true,
      ),
      DataColumn(label: Text('Fecha'), numeric: true),
      DataColumn(label: Text('Hora'), numeric: true),
      DataColumn(
        label: Text('Opciones'),
      )
    ], rows: [
      DataRow(selected: true, cells: [
        DataCell(Text('5')),
        DataCell(Text('24/11/2020')),
        DataCell(Text('14.00 ')),
        DataCell(IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ))
      ]),
    ]);
  }
}
