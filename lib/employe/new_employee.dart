import 'package:employee_data/employe/employee.dart';
import 'package:employee_data/empolyeeprovider/provider_employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewEmployeeScreen extends StatefulWidget {
  @override
  _NewEmployeeScreenState createState() => _NewEmployeeScreenState();
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _placeController = TextEditingController();
  final _idController = TextEditingController();
  String _gender = 'Male';

  void _saveEmployee() {
    if (_formKey.currentState!.validate()) {
      final newEmployee = Employee(
        name: _nameController.text,
        place: _placeController.text,
        id: int.parse(_idController.text),
        gender: _gender,
      );

      Provider.of<Employeeproviderclass>(
        context,
        listen: false,
      ).addEmployees(newEmployee);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Employee")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Enter name" : null,
              ),
              TextFormField(
                controller: _placeController,
                decoration: InputDecoration(labelText: "Place"),
                validator: (value) => value!.isEmpty ? "Enter place" : null,
              ),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: "ID"),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Enter ID" : null,
              ),
              Row(
                children: [
                  Text("Gender: "),
                  Radio(
                    value: "Male",
                    groupValue: _gender,
                    onChanged:
                        (value) => setState(() => _gender = value.toString()),
                  ),
                  Text("Male"),
                  Radio(
                    value: "Female",
                    groupValue: _gender,
                    onChanged:
                        (value) => setState(() => _gender = value.toString()),
                  ),
                  Text("Female"),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _saveEmployee, child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
