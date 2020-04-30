import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huellitasdigitales_moviles/src/pages/myacount_page.dart';
import 'package:huellitasdigitales_moviles/src/pages/myreservation.dart';
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
  /*Recibir parametros de myaccount */
  final DataMyac datamyac;
  /*Recibir parametros de mis reservaciones */
  final DataMyre datamyre;
  /*Recibir parametros de la principal*/
   final DataP datap;

  Reservations({this.datap, this.datamyre, this.datamyac});

  @override
  Widget build(BuildContext context) {
    if(this.datap != null && this.datamyre == null && this.datamyac == null){
      name = this.datap.paramU;
      correo = this.datap.paramC;
    }else if(this.datamyre != null && this.datap == null && this.datamyac == null){
      name = this.datamyre.paramU;
      correo = this.datamyre.paramC;
    }else if(this.datamyac != null && this.datap == null && this.datamyre == null){
      name = this.datamyac.paramU;
      correo = this.datamyac.paramC;
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
              final datanewreserv = Datanewreserv(
                paramU: name,
                paramC: correo 
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyReservations(datanewreserv:datanewreserv)),
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
              final datanewreserv = Datanewreserv(
                paramU: name,
                paramC: correo 
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAcount(datanewreserv:datanewreserv)),
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
                style: TextStyle(fontSize: 20),
              ),
              Divider(),
              reservar(),
            Divider(),
                 CupertinoButton(
                  child: Text('Realizar reservacion.', style: TextStyle(fontSize: 18),),
                  color: Colors.lightGreen,
                   onPressed: () {},
                   
                  ),
                   Divider(),
                   CupertinoButton(
                  child: Text('Cancelar.', style: TextStyle(fontSize: 18),),
                  color: Colors.redAccent,
                   onPressed: () {},
                  ),
                  SizedBox(height: 5),
            
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
                backgroundImage: AssetImage("assets/images/pp.jpeg")),
          ),
          color: Colors.black45);
    } else {
      return new Container(
          child: new UserAccountsDrawerHeader(
            accountName: new Text('Usuario vacios'),
            accountEmail: new Text('Correo vacios'),
            currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage("assets/images/pp.jpeg")),
          ),
          color: Colors.blueGrey);
    }
  }

  Widget reservar() {
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
             border: InputBorder.none,
              hintText: '25/12/2020',
            icon: Icon(Icons.calendar_today),
            labelText: 'Ingrese fecha',
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
          ),
        ),
        SizedBox(width: 50),
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.number,
          maxLines: 1,
          maxLength: 25,
          decoration: InputDecoration(
            hintText: '1',
            icon: Icon(Icons.card_giftcard),
            labelText: 'Cantidad De boletos',
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
          ),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.multiline,
          maxLines: 1,
          maxLength: 6,
          decoration: InputDecoration(
            icon: Icon(Icons.timer),
            hintText: '2:00',
            labelText: 'Hora de llega',
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5)
          ),
        ),
       
        CupertinoButton(
          child: Text('Verificar', style: TextStyle(fontSize: 18),),
          color: Colors.cyan[700],
          onPressed: () {
            // Navega a la segunda ruta cuando se pulsa.
            
          },
        ),
      ]
    );
   
  }
}