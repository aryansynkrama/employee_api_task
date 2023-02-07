// import 'dart:convert';

// import 'package:employees_api_call/remote_services/remote_services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:http/http.dart';

// import 'package:http/http.dart' as http;
// import '../models/employee_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<Employee?> futureData;
//   bool isLoaded = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     futureData = getPosts();
//   }

//   Future<Employee?> getPosts() async {
//     var client = http.Client();
//     var uri = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       // print(json);
//       var data = jsonDecode(json);
//       print(data['data'][0]);
//       return Employee.fromJson(data);
//     }
//     return null;
//   }

  


//   Future<List<Data>> fetchData() async {
//     var client = http.Client();
//     var uri = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       List<dynamic> decodedJson = json.decode(response.body);
//       return decodedJson.map((data) => Data.fromJson(data)).toList();
//     } else {
//       print(response.statusCode);
//       print(response.body);
//       throw Exception('Failed to load data');
//     }
//   }

//   // Future<Employee?> getPosts() async {
//   //   var client = http.Client();
//   //   var uri = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
//   //   var response = await client.get(uri);
//   //   if (response.statusCode == 200) {
//   //     var json = response.body;
//   //     // print(json);
//   //     var data = jsonDecode(json);
//   //     print(data['data'][0]);
//   //     return Employee.fromJson(data);
//   //   }
//   //   return null;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Visibility(
//           visible: isLoaded,
//           child: ListView.builder(
//             itemCount: futureData.,
//             itemBuilder: (context, index) {
//               return Container(
//                 child: Text(futureData![index].employeeSalary.toString()),
//               );
//             },
//           ),
//           replacement: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//         );
//   }
// }
