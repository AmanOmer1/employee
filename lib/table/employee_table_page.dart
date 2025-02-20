import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:employee_data/empolyeeprovider/provider_employee.dart';
import 'package:provider/provider.dart';

class EmployeeTablePage extends StatelessWidget {
  const EmployeeTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeDetails =
        Provider.of<Employeeproviderclass>(context).employeedetails;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable2(
        columnSpacing: 12,
        minWidth: 600,
        columns: const [
          DataColumn(
            label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text('NAME', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text('PLACE', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text(
              'GENDER',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows:
            employeeDetails.map((e) {
              return DataRow(
                cells: [
                  DataCell(Text(e.id.toString())),
                  DataCell(Text(e.name)),
                  DataCell(Text(e.place)),
                  DataCell(Text(e.gender)),
                ],
              );
            }).toList(),
      ),
    );
  }
}
