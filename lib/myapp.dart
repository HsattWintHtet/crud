import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/dataModel.dart';
import 'add.dart';
import 'edit.dart';
import 'home.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
   setState(() {
      data();
   });
  }
  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String,WidgetBuilder>{
'/home': (BuildContext context) => new MyHomePage(),
    '/add' : (BuildContext context) => new Add(),
    '/edit' : (BuildContext context) => new Edit(),
      },
      home: MyHomePage(),
    
    );
  }
}
