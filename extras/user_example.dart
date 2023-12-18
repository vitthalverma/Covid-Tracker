import 'dart:convert';

import 'models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserExample extends StatefulWidget {
  const UserExample({super.key});

  @override
  State<UserExample> createState() => _UserExampleState();
}

class _UserExampleState extends State<UserExample> {
  @override
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: ((context, snapshot) {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userList[index].name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                userList[index].address!.city.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                'latitude'
                                        " " +
                                    userList[index]
                                        .address!
                                        .geo!
                                        .lat
                                        .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                'company'
                                        " " +
                                    userList[index].company!.name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        );
                      }));
                })),
          ),
        ],
      ),
    );
  }
}
