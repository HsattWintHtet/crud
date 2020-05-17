
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import './model/dataModel.dart';

class Edit extends StatefulWidget {
final String name;
final String id;
final int age;

  const Edit({Key key, this.name, this.id, this.age}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  // Control control = Control();
    TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    onPressed: edit,
                                                          ),
                                                        )
                                                ],
                                              ),
                        );
                      }
                    
                      void edit()async {
                                                  await Parse().initialize(
    "myAppId",
    "http://192.168.8.109:1337/parse",
    masterKey: "myMasterKey",
    debug: false,
  );

  var edit = ParseObject('crud')
  ..objectId = widget.id
      ..set('name', '${name.text}')
      ..set('age',int.parse( age.text));
        await edit.save();
        setState(() {
        
      // list.add(Data(name: '${name.text}',age: int.parse(age.text)));
    });
    // name.clear();
    // age.clear();
    // setState(() {
     data();
    // });
  }
}