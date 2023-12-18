// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyRow extends StatelessWidget {
  const MyRow({
    Key? key,
    required this.situation,
    required this.noOfPatients,
  }) : super(key: key);
  final String situation;
  final String noOfPatients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                situation,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(noOfPatients),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.003,
          ),
          Divider(thickness: 0.8),
        ],
      ),
    );
  }
}
