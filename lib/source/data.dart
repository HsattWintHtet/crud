import 'package:crud/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../edit.dart';

class DataSource extends DataTableSource {
  final List<Data> list;
  final BuildContext context;
  DataSource(this.context, this.list);

 int _selectedCount = 0;
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;
  

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Data item = list[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(
        item.name != null ? Text(item.name) : Text(""),
      ),
      DataCell(
        item.age != null ? Text(item.age.toString()) : Text(""),
      ),
      DataCell(
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Edit(
                            id: item.objId,
                            name: item.name,
                            age: item.age,
                            index: index)));
              }),
          
        ),
        DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: ()async {
                   await Parse().initialize(
    "myAppId",
    "http://192.168.1.103:1337/parse",
    // "http://localhost:1337/parse",
    masterKey: "myMasterKey",
    debug: true,
  );
                list.removeAt(index);
                print(item.objId);
               ParseObject("crud")..delete(id: item.objId, path: "");
                notifyListeners();
              }))
    ]);
  }

  void sort(getField(lists), bool ascending) {
    list.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}
