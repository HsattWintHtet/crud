
import 'package:crud/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../edit.dart';

class DataSource extends DataTableSource{
    final List<Data> _lists = list;



  int _selectedCount = 0;
 final BuildContext context;

  DataSource(this.context);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount=> list.length;
  

  @override
  int get selectedRowCount => _selectedCount;

    @override
  DataRow getRow(int index) {
    //     assert(index >= 0);
    // if (index >= _lists.length) return null;
final Data lists = _lists[index];
    return  DataRow.byIndex(
      index: index,
      cells: <DataCell>[
          DataCell(  lists.name != null ? Text(lists.name) : Text(""),),
          DataCell(lists.age != null ? Text(lists.age.toString()): Text(""),),
           DataCell(Row( children: <Widget>[
             IconButton(icon: Icon(Icons.edit), onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (_)=> Edit(id : lists.objId,name: lists.name,age : lists.age)));
             }),
             IconButton(icon: Icon(Icons.delete), onPressed:(){
               list.removeAt(index);
                 ParseObject("crud")
                 ..delete(id :lists.objId ,path:"path" );
                 notifyListeners();
             })
             
                        ],)),
                   ]
                
                 );
    
               }
               void sort(getField(lists),bool ascending){
                   list.sort((a,b){
                     if(!ascending){
                      final  c=a;
                       a=b;
                       b=c;
                     }
                     final aValue = getField(a);
                     final bValue = getField(b);
             
                     return Comparable.compare(aValue, bValue);
                   });
                   notifyListeners();
               }

}
