import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  // reference for our box

  final _mybox = Hive.box('myStorageBox');

  // Write Data

  void writeData() {
    _mybox.put('Name', 'Jaydip');
  }

  // Read Data
  void readData() {
    print(_mybox.get('Name'));
  }

  // Delete Data
  void deleteData() {
    _mybox.delete('Name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hive Local Database',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: writeData,
              style: ElevatedButton.styleFrom(primary: Colors.amber[300]),
              child: const Text(
                'Write',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: readData,
              style: ElevatedButton.styleFrom(primary: Colors.amber[300]),
              child: const Text(
                'Read',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: deleteData,
              style: ElevatedButton.styleFrom(primary: Colors.amber[300]),
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
