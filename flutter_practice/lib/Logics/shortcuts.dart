import 'package:flutter/material.dart';

class WidgetsShortcuts extends ChangeNotifier {
  Text text(txt, {clr, fw, fs, dcr}) {
    return Text(
      txt,
      style: TextStyle(
          decoration: dcr,
          color: clr ?? Colors.black,
          fontSize: fs ?? 20.0,
          fontWeight: fw ?? FontWeight.normal),
    );
  }

  InputDecoration dcrt(label, hint, {suffix, prefix}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.black, fontSize: 15),
      labelText: label,
      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
      suffixIcon: suffix ?? null,
      prefixIcon: prefix ?? null,
      hintMaxLines: 1,
    );
  }
}
