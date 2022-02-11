import 'package:flutter/material.dart';

import '../models/data_model.dart';
import '../utils/palette.dart';

class EmployeeItem extends StatefulWidget {
  final EmployeesModel item;

  const EmployeeItem({Key? key, required this.item}) : super(key: key);

  @override
  State<EmployeeItem> createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        child: ListTile(
            contentPadding: const EdgeInsets.only(left: 8, right: 8),
            leading: widget.item.profileImage.isNotEmpty
                ? ClipOval(
                    child: Image.network(
                      widget.item.profileImage,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(Icons.account_circle,
                        color: Palette.onSurface, size: 48)),
            title: Text(widget.item.employeeName,
                textScaleFactor: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Palette.onSurface)),
            subtitle: Text("Age: ${widget.item.employeeAge}",
                textScaleFactor: 0.9,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Palette.onSurface)),
            trailing: Text("\$${widget.item.employeeSalary}",
                textScaleFactor: 1,
                maxLines: 1,
                style: const TextStyle(color: Palette.onSurface)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "${widget.item.employeeName} is ${widget.item.employeeAge} years old."),
              ));
            }));
  }
}
