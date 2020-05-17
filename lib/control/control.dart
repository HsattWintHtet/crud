import 'dart:convert';
import 'package:crud/model/dataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:flutter/material.dart';


 List<Data> list = <Data>[];
class Control extends ChangeNotifier{
  Control._() : super();
  static Control _this;
  factory Control() {
    if (_this == null) _this = Control._();
    return _this;
  }
 
    data() async {
      print("dddd");
  await Parse().initialize(
    "myAppId",
    "http://192.168.8.109:1337/parse",
    masterKey: "myMasterKey",
    debug: false,
  );
try {
  var apiResponse =await ParseObject('crud').getAll();
if(apiResponse.success){
    final List<dynamic> json = const JsonDecoder().convert(apiResponse.result.toString());
    list.clear();
   list = json.map((data)=> new Data.fromJson(data)).toList();
notifyListeners();
}
} catch (e) {
  print("No Data or No Internet");
}
notifyListeners();
}


}