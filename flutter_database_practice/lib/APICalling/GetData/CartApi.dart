import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetApiCall extends StatefulWidget {
  const GetApiCall({super.key});

  @override
  State<GetApiCall> createState() => _GetApiCallState();
}

class _GetApiCallState extends State<GetApiCall> {
  CartServices cs = CartServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data From Cart Api'),
      ),
      body: FutureBuilder(
        future: cs.getData(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List dataList = snapShot.data! as List;
            return ListView.separated(
                itemCount: dataList.length,
                separatorBuilder: (context, index) => Divider(thickness: 3),
                itemBuilder: (BuildContext Context, int index) {
                  return ListTile(
                    title: Text('${dataList[index].userId.toString()}'),
                    subtitle: Column(
                      children: [
                        Text('${dataList[index].pi.toString()}'),
                        Text('${dataList[index].qt.toString()}'),
                        Text('${dataList[index].date.toString()}'),
                      ],
                    ),
                    leading: CircleAvatar(
                      child: Text('${dataList[index].id.toString()}'),
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class CartServices {
  Future<List<CartModel>> getData() async {
    var cart = await get(
      Uri.https('fakestoreapi.com', 'carts'),
    );

    if (cart.statusCode == 200) {
      List<dynamic> data = jsonDecode(cart.body);
      List<CartModel> finalList =
      data.map((e) => CartModel.fromJson(e)).toList();

      return finalList;
    } else {
      throw "Can't get data";
    }
  }
}

class CartModel {
  late int id, userId, vp, pi, qt;
  late String date;

  CartModel({
    required this.id,
    required this.userId,
    required this.vp,
    required this.pi,
    required this.qt,
    required this.date,
  });

  factory CartModel.fromJson(Map jsonData) {
    Map products = jsonData["products"];

    var data = CartModel(
      id: jsonData["id"] ?? 0,
      userId: jsonData["userId"] ?? 0,
      vp: jsonData["__v"] ?? 0,
      pi: products["productId"] ?? 0,
      qt: products["quantity"] ?? 0,
      date: jsonData["data"] ?? 'No data',
    );
    return data;
  }
}

/*
List a = [
  {
    "id": 1,
    "userId": 1,
    "date": "2020-03-02T00:00:00.000Z",
    "products": [
      {"productId": 1, "quantity": 4},
      {"productId": 2, "quantity": 1},
      {"productId": 3, "quantity": 6}
    ],
    "__v": 0
 }
];
*/
