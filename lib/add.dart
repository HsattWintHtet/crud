import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();


@override
  

  @override
  Widget build(BuildContext context) {
    final co = Provider.of<Control>(context);
    return  Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          
          title: Text("Add"),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
                    title: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Name",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    title: TextField(
                      controller: age,
                      decoration: InputDecoration(
                        labelText: "Age",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: RaisedButton(
                      child: Text(
                        "Add",
                      ),
                      onPressed: (){
                        co.add(name.text,age.text);
                        name.clear();
                        age.clear();
                      },
                                        ),
                                      )
                              ],
                            
                          ),
    );
                      }
                    
              
  
}