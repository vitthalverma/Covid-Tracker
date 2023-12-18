// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_demo/myrow.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.totalCasesm,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) : super(key: key);
  final String name;
  final String image;
  final int totalCasesm,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.image),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Card(
              child: Column(
                children: [
                  MyRow(
                      situation: 'Cases',
                      noOfPatients: widget.totalCasesm.toString()),
                  MyRow(
                      situation: 'totalDeaths',
                      noOfPatients: widget.totalDeaths.toString()),
                  MyRow(
                      situation: 'totalRecovered',
                      noOfPatients: widget.totalRecovered.toString()),
                  MyRow(
                      situation: 'active',
                      noOfPatients: widget.active.toString()),
                  MyRow(
                      situation: 'critical',
                      noOfPatients: widget.critical.toString()),
                  MyRow(
                      situation: 'todayRecovered',
                      noOfPatients: widget.todayRecovered.toString()),
                  MyRow(
                      situation: 'test', noOfPatients: widget.test.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
