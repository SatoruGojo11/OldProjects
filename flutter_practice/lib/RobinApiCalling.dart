import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RobinApi extends StatefulWidget {
  const RobinApi({super.key});

  @override
  State<RobinApi> createState() => _RobinApiState();
}

class _RobinApiState extends State<RobinApi> {
  var alldata;

  Future fetchdata() async {
    var data = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var apidata = jsonDecode(data.body);
    setState(() {
      alldata = apidata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Robin Api Calling',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(thickness: 3),
        itemCount: 10,
        itemBuilder: (context, index) {
          print(alldata.toString());
          return ListTile(
            // title: Text('${apidata[index]['userId']}'),
            // subtitle: Text('${apidata[index]['title']}',maxLines: 2,),
            title: Text('Hello'),
            subtitle: Text('Hello1'),
          );
        },
      ),
    );
  }
}
