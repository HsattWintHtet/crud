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
 