import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;

  const MyTextField({
    super.key,
    required this.ctrl,
    required this.hintText,
    required this.obscureText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        controller: ctrl,
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.white60,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        keyboardType: textInputType,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9a-zA-Z@$. ]+$'))
        ],
        validator: (value) {
          if (value!.isEmpty)
            return '!!!! Required !!!!';
          else
            return null; // return null if input is valid
        },
      ),
    );
  }
}
