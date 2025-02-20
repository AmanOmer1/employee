import 'package:employee_data/employe/new_employee.dart';
import 'package:employee_data/table/employee_table_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewEmployeeScreen(),
                      ),
                    );
                  },
                  label: Text('New User'),
                  icon: Icon(Icons.add_outlined),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(child: EmployeeTablePage()),
          ],
        ),
      ),
    );
  }
}
