import 'dart:async';
import 'dart:convert';

import 'package:gt_codetest/models/data_model.dart';
import 'package:http/http.dart' as http;

class EmployeesApi {
  static Future<List<EmployeesModel>> fetchEmployees() async {
    final response = await http.get(
        Uri.parse("http://dummy.restapiexample.com/api/v1/employees"),
        headers: {"Content-Type": "application/json"});

    Iterable list = json.decode(response.body)["data"];
    List<EmployeesModel> employeesList =
        list.map((item) => EmployeesModel.fromJson(item)).toList();

    // Extra employee with url image
    employeesList.add(EmployeesModel(
        0, "Victor Bergene", 100000, 20, "https://walmin.com/images/me.jpg"));

    employeesList.sort((a, b) => (a.employeeName).compareTo(b.employeeName));

    return employeesList;
  }
}
