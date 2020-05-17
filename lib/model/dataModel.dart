import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'dart:convert';
class Data{
  final String objId;
  final String name;
  final int age;
  Data({this.name,this.age,this.objId});

  factory Data.fromJson(Map<String,dynamic> json){
    return new Data(
      objId:  json['objectId'] ,
        name:  json['name'],
         age:  json['age'] ,

    );
  }
}
 List<Data> list = List<Data>();

  data() async {
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
   json.map((data)=> list.add(new Data.fromJson(data))).toList();
print(list.length);
}
// notifyListeners();
} catch (e) {
  print("No Data or No Internet");
}
// notifyListeners();
}