import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Apidata extends ChangeNotifier {
  var products;

  Future getapidata() async {
    var api = await http.get(
      Uri.parse('https://fir-a-to-z-default-rtdb.firebaseio.com/Products.json'),
    );
    if (api.statusCode == 200) {
      var data = jsonDecode(api.body);
      products = data;
      notifyListeners();
    } else {
      return CircularProgressIndicator();
    }
  }

//   var data = [];
//
//   Future fetchproductsdata() async {
//     data = await products();
//     notifyListeners();
//     return data;
//   }
//
//   Future products() async {
//     var api = await http.get(
//       Uri.parse('https://fir-a-to-z-default-rtdb.firebaseio.com/Products.json'),
//     );
//
//     try {
//       if (api.statusCode == 200) {
//         print('service');
//         var response =
//             jsonDecode(api.body).map((e) => ProductsModel.fromJson(e)).toList();
//         return response;
//       } else {
//         return CircularProgressIndicator(color: Colors.green);
//       }
//     } catch (e) {
//       print(e);
//       return CircularProgressIndicator(color: Colors.red);
//     }
//   }
}
