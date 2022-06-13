import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatefulWidget {

  const MyDataTable( {
    required this.name, Key? key}):super(key: key);
  final String name;
  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  CollectionReference usersList =
  FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    Future<List> userList = getUsersList();

    return  Container(
      height: 450,
      alignment: const Alignment(0,-1),
      child: Scrollbar(
        child:SingleChildScrollView(
            child: FutureBuilder<dynamic>(
              future: userList,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Text('Wait a moment');
                }
                if(snapshot.connectionState == ConnectionState.done) {
                  return buildDataTable(snapshot.data, widget.name);
                }
                if(snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                return const Text("  ");
                },
          ),
        ),
      ),
      );
  }
  @override
  void initState() {
    super.initState();
  }


  Future<List> getUsersList() async {
    var querySnapshot = await usersList.orderBy(widget.name, descending: true).get();
      return querySnapshot.docs;
  }
  }

  Widget buildDataTable(snapshotData, String name) {
    final columns = ['Place', 'ID', 'Name', 'points'];

    return DataTable(
      columnSpacing: 10.0,
      columns: getColumns(columns),
      rows: getRows(snapshotData, name),
    );
  }
  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(

        label: Text(column),
      );
    }).toList();
  }

  List<DataRow> getRows(dynamic snapshotData, String name) {
    List<DataRow> rows = [];
    int length = snapshotData.length;
    for(int i = 0; i < length; i++){
      dynamic user = snapshotData[i];
      bool anonymous = user["anonymous"];
      if (anonymous) {
        rows.add(
            DataRow(
                cells: [
                  DataCell(
                      Text("${i+1}")
                  ),
                  const DataCell(
                    Text("anonym"),
                  ),
                  const DataCell(
                    Text("anonym"),
                  ),
                  DataCell(
                    Text("${user[name]}"),
                  ),
                ]
            )
        );
      }
      else {
        rows.add(
            DataRow(
                cells: [
                  DataCell(
                      Text("${i+1}")
                  ),
                  DataCell(
                    Text("${user["shared_id"]}"),
                  ),
                  DataCell(
                      Text(user["name"]),
                  ),
                  DataCell(
                    Text("${user[name]}"),
                  ),
                ]
            )
        );
      }
    }
    return rows;
  }




