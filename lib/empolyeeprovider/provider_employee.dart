import 'package:employee_data/employe/employee.dart';
import 'package:flutter/material.dart';

class Employeeproviderclass with ChangeNotifier {
  final List<Employee> _employeelist = [
    Employee(id: 1, name: "John Doe", place: "New York", gender: "Male"),
    Employee(id: 2, name: "Jane Smith", place: "Los Angeles", gender: "Female"),
    Employee(id: 3, name: "Michael Brown", place: "Chicago", gender: "Male"),
  ];

  List<Employee> get employeedetails => _employeelist;

  void addEmployees(Employee newemployee) {
    _employeelist.add(newemployee);
    notifyListeners();
  }
}
