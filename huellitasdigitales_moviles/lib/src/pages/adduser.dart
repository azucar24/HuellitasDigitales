import 'package:flutter/material.dart';

class UserAd extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
        title: Text("Huellita Digital, El Salvador"),
        backgroundColor: Colors.blueGrey,
      ),
      body: 
        Center(
          child: Column(
            children: <Widget>[
              Image(image:AssetImage("assets/images/pp.jpg"), width:300,height:300),
              Text("Estas en agregar nuevo usuario", style: TextStyle(fontSize: 35),),
              Cajitas()
            ],
          ) 
        )
    );
  }
}

Widget Cajitas(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        
      ]
    );
}