import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../remote_services/remote_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Employee? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    data = await remoteServices.getEmployeeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data?.data?.length,
        itemBuilder: (context, index) {
          return Container(
            child: Text(data!.data![index].id.toString()),
          );
        },
      ),
    );
  }
}
