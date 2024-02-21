import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Homepage.dart';

void main(List<String> args) async {
  // initialize Hive box
  await Hive.initFlutter();

  //create a Hive box to store the data
  var mybox = await Hive.openBox('myStorageBox');
  log(mybox.toString());

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
    ),
  );
}
