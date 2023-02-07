import 'dart:convert';

import 'package:employees_api_call/models/employee_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  // Future<List<Employee>?> getPosts() async {
  //   var client = http.Client();
  //   var uri = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     var data = jsonDecode(json);
  //     return Employee.fromJson(json);
  //   }
  //   return null;
  // }

  Future<Employee?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      // print(json);
      var data = jsonDecode(json);
      print(data['data'][0]);
      return Employee.fromJson(data);
    }
    return null;
  }

  Future<List<Data>> fetchData() async {
    var client = http.Client();
    var uri = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> decodedJson = json.decode(response.body);
      return decodedJson.map((data) => Data.fromJson(data)).toList();
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load data');
    }
  }
}
