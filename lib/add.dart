import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'model/dataModel.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();


@override
  void initState() {
    super.initState();
  print("initState");
  }
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
  @override
  void didUpdateWidget(Add oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: ()async{
            Navigator.pop(context,true);
            // Navigator.pushReplacementNamed(context, "/home");
            setState(() {
              
            });
            return false;
            
          },
          child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context,true);
            // Navigator.pushReplacementNamed(context, "/home");
          setState(() {
            
          });
         
          }),
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
                      onPressed: add,
                                        ),
                                      )
                              ],
                            ),
                          ),
    );
                      }
                    
                      void add()async {
                          await Parse().initialize(
    "myAppId",
    "http://192.168.8.109:1337/parse",
    masterKey: "myMasterKey",
    debug: false,
  );

  var add = ParseObject('crud')
      ..set('name', '${name.text}')
      ..set('age',int.parse( age.text));
        await add.save();
     
         setState((){
        list.add(Data(name: '${name.text}',age: int.parse(age.text)));
      });
      // _lists
    name.clear();
    age.clear();
  //  setState(() {
      data();
    Navigator.pop(context);
  //  });
   
  }
  
}