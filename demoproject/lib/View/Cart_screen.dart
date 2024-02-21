import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      body: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
      // body: SingleChildScrollView(
      //   child: ListView.separated(
      //     separatorBuilder: (context, index) => Divider(thickness: 3),
      //     itemCount: 10,
      //     itemBuilder: (context, index) {
      //       return ListTile(title: Text('Hello there, These is a Cart Page',style: TextStyle(color: Colors.black87),));
      //     },
      //   ),
      // ),
    );
  }
}
