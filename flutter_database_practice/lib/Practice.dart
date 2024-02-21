import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefPrac extends StatefulWidget {
  const SharePrefPrac({super.key});

  @override
  State<SharePrefPrac> createState() => _SharePrefPracState();
}

class _SharePrefPracState extends State<SharePrefPrac> {
  var _name = TextEditingController();
  var _email = TextEditingController();

  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    final holder = await SharedPreferences.getInstance();
    setState(() {
      print(holder.getString('Email-id'));
      print(holder.getString('Name'));
      name = holder.getString('Name') ?? 'Null data';
      email = holder.getString('Email-id') ?? 'Null data';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shared Preference Practice',
          style: TextStyle(
            fontSize: 25,
          ),
          maxLines: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // FutureBuilder(
              //     future: SharedPreferences.getInstance(),
              //     builder: (context, snapshot) {
              //       return Column(
              //         children: [
              //           Text('${snapshot.data!.getString('Name').toString()}'),
              //           Text(
              //               '${snapshot.data!.getString('Email-id').toString()}'),
              //         ],
              //       );
              //     }),
              TextField(controller: _name),
              TextField(controller: _email),
              ElevatedButton(
                onPressed: () {
                  savedata();
                  setState(() {});
                },
                child: Text('Submit'),
              ),
              Column(
                children: [
                  Text(_name.text),
                  Text(_email.text),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  savedata() async {
    final holder = await SharedPreferences.getInstance();
    setState(() {
      holder.setString('Name', _name.text).toString();
      holder.setString('Email-id', _email.text).toString();
    });
  }
}
