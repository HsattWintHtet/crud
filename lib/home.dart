import 'package:flutter/material.dart';
import 'control/control.dart';
import 'source/data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final  control = Control();
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 1), () {
      setState(() {
        control.data();
      });
    // });
    print("ddd");
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
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
  // int _sortColumnIndex;
  bool _sortAscending = true;
  // var _rowParPage = 5;
  @override
  Widget build(BuildContext context) {
    // final control = Provider.of<Co>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: Text("home"),
      ),
      body: SingleChildScrollView(
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              PaginatedDataTable(
                header: Text(
                  "Register List",
                  style: TextStyle(color: Colors.amber),
                ),
                source: DataSource(context),
                rowsPerPage: 5,
                // availableRowsPerPage: [5,10,15,20],
                sortAscending: _sortAscending,
                sortColumnIndex: 1,
                onSelectAll: (bool value) {},
                showCheckboxColumn: true,
                headingRowHeight: 20.0,
                // onRowsPerPageChanged: (v) {
                //   setState(() {
                //     _rowParPage = v;
                //   });
                // },
                columns: <DataColumn>[
                  DataColumn(
                    // numeric: true,
                    label: Container(
                      child: Text("Name"),
                      // width: ,
                    ),
                    onSort: (int columnIndex, bool ascending) {
                      setState(() {
                        _sortAscending = ascending;
                        if(ascending){
                        list.sort((a,b)=> a.name.compareTo(b.name));
                        }else{
                          list.sort((a,b)=> b.name.compareTo(a.name));
                        }
                      });
                      // data.sort(
                      //     (lists) => lists.length, ascending);
                      // setState(() {
                      //   _sortColumnIndex = columnIndex;
                      //   _sortAscending = ascending;
                      // });
                    }
                  ),
                  DataColumn(
                      // numeric: true,
                      label: Container(
                    child: Text("Age"),
                    // width: 90,
                  )),

                  DataColumn(label: Container(
                    child: Text("Action"),
                    // width: 90,
                  ))
                ],
              ),
            ],
          ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, "/add");
      },child: Icon(Icons.add),),
    );
  }
}
