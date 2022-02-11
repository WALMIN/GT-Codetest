import 'package:flutter/material.dart';

import '../components/employee_item.dart';
import '../data/employees_api.dart';
import '../models/data_model.dart';
import '../utils/palette.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({Key? key}) : super(key: key);

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EmployeesModel>>(
      future: EmployeesApi.fetchEmployees(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children: [
            Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const ListTile(
                    contentPadding: EdgeInsets.only(left: 16, right: 16),
                    leading: SizedBox(width: 48),
                    title: Text("Full name",
                        textScaleFactor: 1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.onBackground)),
                    trailing: Text("Salary",
                        textScaleFactor: 1.1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.onBackground)))),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return EmployeeItem(item: snapshot.data![index]);
                    }))
          ]);
        } else if (snapshot.hasError) {
          return const Expanded(
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                          "Oops! No employees to show, try again later!",
                          textAlign: TextAlign.center,
                          textScaleFactor: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.onBackground)))));
        } else {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
