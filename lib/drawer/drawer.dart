import 'package:example/home/home.dart';
import 'package:example/map/map.dart';
import 'package:example/page/listview.dart';
import 'package:flutter/material.dart';

Drawer drawer(BuildContext context) {
  return Drawer(child: list(context));
}
ListView list(BuildContext context) {
  return ListView(padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
        ),
        otherAccountsPictures: [ CircleAvatar(
          backgroundColor: Colors.white,
        )
        ],
        accountName: Text('yongho',style: TextStyle(color:Colors.black),),
        accountEmail: Text('yongho1037@gmail.com',style: TextStyle(color:Colors.black),),

        decoration: BoxDecoration(color: Colors.grey[200],
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0))),),
      ListTile(
        leading: Icon(Icons.home, color: Colors.grey[850]),
        title: Text('Home'),
        onTap: () {
        },
        ),
      ListTile(
        leading: Icon(Icons.settings, color: Colors.grey[850]),
        title: Text('Setting'),
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
        },
       ),
      ListTile(
        leading: Icon(Icons.question_answer, color: Colors.grey[850]),
        title: Text('MAP'),
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>googleMap()));
        },)
    ],
  );
}