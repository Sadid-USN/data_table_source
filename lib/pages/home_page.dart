import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final DataTableSource _data = MyDataTable();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PaginatedDataTable(
              arrowHeadColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue),
              horizontalMargin: 80,
              header: const Center(
                child: Text('Product prices'),
              ),
              columns: const [
                DataColumn(label: Text(' ID')),
                DataColumn(label: Text(' Name')),
                DataColumn(label: Text(' Price')),
              ],
              source: _data,
            ),
          ],
        ),
      ),
    );
  }
}

class MyDataTable extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": "${index + 1}",
            "product": "Product - ${index + 1}",
            "price": Random().nextInt(10000),
          });
  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]['product'])),
      DataCell(Text(_data[index]['price'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
