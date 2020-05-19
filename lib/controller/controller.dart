import 'dart:convert';

import 'package:crud/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Control extends ChangeNotifier {
  factory Control() {
    if (_this == null) _this = Control._();
    return _this;
  }
  static Control _this;
  Control._() : super();
  List<Data> get list => show;
  List<Data> lists = List<Data>();
  List<Data> show = List<Data>();
  void data() async {
    await Parse().initialize(
      "myAppId",
      "http://192.168.1.103:1337/parse",
      // "http://localhost:1337/parse",
      masterKey: "myMasterKey",
      debug: true,
    );
    try {
      var apiResponse = await ParseObject('crud').getAll();
      if (apiResponse.success) {
        final List<dynamic> json =
            const JsonDecoder().convert(apiResponse.result.toString());
        lists.clear();
        lists = json.map((data) => new Data.fromJson(data)).toList();
        show = lists;
        // show = list;
        notifyListeners();
        print(show.length);
      }
    } catch (e) {
      print("No Data or No Internet");
    }
    notifyListeners();
  }

  void add(String name, String age) async {
    await Parse().initialize(
      "myAppId",
      "http://192.168.1.103:1337/parse",
      // "http://localhost:1337/parse",
      masterKey: "myMasterKey",
      debug: false,
    );

    var add = ParseObject('crud')
      ..set('name', name)
      ..set('age', int.parse(age));
    await add.save();

    lists.add(Data(name: name, age: int.parse(age), objId: add.objectId));
    notifyListeners();
  }

  void edit(String id, String name, String age, int index) async {
    await Parse().initialize(
      "myAppId",
      "http://192.168.1.103:1337/parse",
      // "http://localhost:1337/parse",
      masterKey: "myMasterKey",
      debug: false,
    );

    var edit = ParseObject('crud')
      ..objectId = id
      ..set('name', name)
      ..set('age', int.parse(age));
    await edit.save();

    lists.replaceRange(
        index, index + 1, [Data(age: int.parse(age), name: name, objId: id)]);
    notifyListeners();
  }

  void search(String value){
    if(value.isNotEmpty || value.length != 0){
show = lists.where((data) {
          var name = data.name.toLowerCase();
          var age = data.age.toString().toLowerCase();
          return name.contains(value.toLowerCase()) ||
              age.contains(value.toLowerCase());
        }).toList();
        
        notifyListeners();
    }
    else{
      show = lists;
      notifyListeners();
    }
  }
}
