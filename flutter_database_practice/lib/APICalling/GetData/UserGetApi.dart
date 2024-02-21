import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  UserServices services = UserServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Api'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: services.getData(),
          builder: (context, snapShot) {
            print('Main Screen');
            if (snapShot.hasData) {
              List<UsersModel> dataList = snapShot.data! as List<UsersModel>;
              return ListView.separated(
                itemCount: dataList.length,
                separatorBuilder: (context, index) => Divider(thickness: 3),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: Text('User Screen'),
                              centerTitle: true,
                            ),
                            body: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                          'Id :- ${dataList[index].id.toString()}',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'Longitude :- ${dataList[index].lat}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'latitude :- ${dataList[index].city}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'Street Name :-  ${dataList[index].street}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'House Number :- ${dataList[index].number.toString()}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'Zip Code :- ${dataList[index].zipcode}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'Email-id :- ${dataList[index].email}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'User Name :- ${dataList[index].username}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'PassWord :- ${dataList[index].password}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'FirstName :- ${dataList[index].firstname}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'LastName :- ${dataList[index].lastname}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        'Phone Number :- ${dataList[index].phone}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Chip(
                                      label: Text(
                                        '__v :- ${dataList[index].vp.toString()}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    leading: Text('${dataList[index].id.toString()}'),
                    title:
                        Text('Name :- ${dataList[index].firstname.toString()}'),
                    subtitle: Text(
                        'Phone No. :- ${dataList[index].phone.toString()}'),
                  );
                  // setState(() {});
                },
              );
            } else {
              return CircularProgressIndicator(color: Colors.red);
            }
          },
        ),
      ),
    );
  }
}

class UserServices {
  Future<List> getData() async {
    var users = await get(Uri.https('fakestoreapi.com', 'users'));
    print(users.statusCode);
    if (users.statusCode == 200) {
      List<dynamic> body = jsonDecode(users.body);
      List<UsersModel> dataList = body.map((e) {
        var temp = UsersModel.fromJson(e);
        return temp;
      }).toList();
      return dataList;
    } else
      throw Exception("Can't get Data");
  }
}

class UsersModel {
  final int id, vp, number;
  final String city,
      street,
      zipcode,
      email,
      username,
      password,
      firstname,
      lastname,
      phone,
      lat,
      long;

  UsersModel({
    required this.id,
    required this.vp,
    required this.number,
    required this.city,
    required this.street,
    required this.zipcode,
    required this.email,
    required this.username,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.lat,
    required this.long,
  });

  factory UsersModel.fromJson(Map jsonData) {
    print('Model');
    Map address = jsonData['address'];
    Map geolocation = address['geolocation'];
    Map name = jsonData['name'];
    print('M1');
    var data = UsersModel(
      id: jsonData['id'] ?? 0,
      vp: jsonData['__v'] ?? 0,
      number: address['number'] ?? 0,
      city: address['city'] ?? 'No data',
      street: address['street'] ?? 'No data',
      zipcode: address['zipcode'] ?? 'No data',
      email: jsonData['email'] ?? 'No data',
      username: jsonData['username'] ?? 'No data',
      password: jsonData['password'] ?? 'No data',
      firstname: name['firstname'] ?? 'No data',
      lastname: name['lastname'] ?? 'No data',
      phone: jsonData['phone'] ?? 'No data',
      lat: geolocation['lat'] ?? 'No data',
      long: geolocation['long'] ?? 'No data',
    );
    print('ML');
    return data;
  }
}
