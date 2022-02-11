import 'package:flutter/material.dart';
import 'package:gt_codetest/screens/employees_list.dart';
import 'package:gt_codetest/utils/material_colors.dart';
import 'package:gt_codetest/utils/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Employees",
        theme: ThemeData(primarySwatch: generateMaterialColor(Palette.primary)),
        home: const MyHomePage(title: "Employees"),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(child: EmployeesList()));
  }
}
