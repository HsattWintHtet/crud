import 'package:crud/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'source/data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      final Control control = Control();
@override
void initState() { 
  super.initState();
  setState(() {
    control.data();
    // control.show = control.lists;
  });
}
    TextEditingController controller = TextEditingController();
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  var _rowsPerPage =PaginatedDataTable.defaultRowsPerPage;
bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<Control>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: Text("home"),
      ),
      body: SingleChildScrollView(
       
        child: PaginatedDataTable(
          header: Text(
            "Register List",
            style: TextStyle(color: Colors.amber),
            
          ),
          actions: <Widget>[
            isSearch ?Container(
                                 width: 100,
                                 child: TextField(
                              
                controller: controller,
                onChanged:control.search,
              ),
                               ) : Container(),
           isSearch ? IconButton(icon: Icon(Icons.cancel), onPressed: (){
                setState(() {
                  isSearch = !isSearch;
                  controller.clear();
                  // control.data();
                  control.search("");
                });

            }) : IconButton(icon: Icon(Icons.search), onPressed: (){
                setState(() {
                  isSearch = !isSearch;
                });
            })
          ],
          source: DataSource(context, control.list),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: const [5,10,15,20],
          sortAscending: _sortAscending,
          sortColumnIndex: _sortColumnIndex,
         
          headingRowHeight: 20.0,
          onRowsPerPageChanged: (int v) {
            setState(() {
              _rowsPerPage = v;
            });
          },
          
          columns: <DataColumn>[
            DataColumn(
                // numeric: true,
                label: Container(
                  child: Text("Name"),
                  // width: ,
                ),
                onSort: (index, sortAscending) {
            setState(() {
              _sortAscending = sortAscending;
              if (sortAscending) {
                control.list.sort((a, b) => a.name.compareTo(b.name));
              } else {
                control.list.sort((a, b) => b.name.compareTo(a.name));
              }
            });
          }
                ),
            DataColumn(
                // numeric: true,
                label: Container(
              child: Text("Age"),
              // width: 90,
            )),
            DataColumn(
                label: Container(
              child: Text("Edit"),
              // width: 90,
            )),
            DataColumn(
                label: Container(
              child: Text("Delete"),
              // width: 90,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
