import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';

class Edit extends StatefulWidget {
final String name;
final String id;
final int age;
final int index;

  const Edit({Key key, this.name, this.id, this.age,this.index}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  // Control control = Control();
    TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final co = Provider.of<Control>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body:Column(
        children: <Widget>[
          ListTile(
                  title: TextField(
                    controller: name..text = "${widget.name}",
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
                    controller: age..text = "${widget.age}",
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
                      "Edit",
                    ),
                    onPressed: (){
                    co.edit(widget.id,name.text,age.text,widget.index);
                    Navigator.of(context).pop();
                    },
                                                          ),
                                                        )
                                                ],
                                              ),
                        );
                      }
                    
                     
}