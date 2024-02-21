import 'package:flutter/material.dart';

class SafeAreaApp extends StatefulWidget {
  const SafeAreaApp({super.key});

  @override
  State<SafeAreaApp> createState() => _SafeAreaAppState();
}

class _SafeAreaAppState extends State<SafeAreaApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Safe Area App'),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              'Safe Area Practice',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
