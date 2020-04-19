import 'package:flutter/material.dart';
import 'package:huellitasdigitales_moviles/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Huellitas digitales",
      //home: HomePage(),
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'home'    : (BuildContext context) => HomePage(),
        'useradd' : (BuildContext context) => UserAdd(),
      },
    );
  }
}