import 'dart:convert';

import 'package:employees_api_call/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Employee> getEmployeeDetails() async {
    final response = await http.get(
      Uri.parse("https://dummy.restapiexample.com/api/v1/employees"),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Employee.fromJson(data);
    } else {
      return Employee.fromJson(data);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmployeeDetails();
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<Employee>(
                future: getEmployeeDetails(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: screenWidth,
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                              color:
                                  (index % 2 == 0) ? Colors.green : Colors.yellow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Text(
                                    'Employee',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Id : " +
                                          snapshot.data!.data![index].id
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Name : " +
                                          snapshot
                                              .data!.data![index].employeeName
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Salary : " +
                                          snapshot
                                              .data!.data![index].employeeSalary
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Age : " +
                                          snapshot
                                              .data!.data![index].employeeAge
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
