import 'package:api_demo/myrow.dart';
import 'package:api_demo/services/stats_services.dart';
import 'package:api_demo/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatScreen extends StatefulWidget {
  const WorldStatScreen({super.key});

  @override
  State<WorldStatScreen> createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen>
    with TickerProviderStateMixin {
  late final _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            FutureBuilder(
                future: statsServices.fetchWorldStatsRecords(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                          controller: _controller,
                        ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          dataMap: {
                            'Total':
                                double.parse(snapshot.data!.cases.toString()),
                            'Recovered': double.parse(
                                snapshot.data!.recovered.toString()),
                            'Deaths':
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartType: ChartType.ring,
                          ringStrokeWidth: 22,
                          chartRadius: MediaQuery.of(context).size.height * 0.6,
                          animationDuration: const Duration(milliseconds: 1200),
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                            showLegends: true,
                            legendTextStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        Card(
                          child: Column(
                            children: [
                              MyRow(
                                  situation: 'Total',
                                  noOfPatients:
                                      snapshot.data!.cases.toString()),
                              MyRow(
                                  situation: 'Deaths',
                                  noOfPatients:
                                      snapshot.data!.deaths.toString()),
                              MyRow(
                                  situation: 'Recovered',
                                  noOfPatients:
                                      snapshot.data!.recovered.toString()),
                              MyRow(
                                  situation: 'Active',
                                  noOfPatients:
                                      snapshot.data!.active.toString()),
                              MyRow(
                                  situation: 'Critical',
                                  noOfPatients:
                                      snapshot.data!.critical.toString()),
                              MyRow(
                                  situation: 'Today Deaths',
                                  noOfPatients:
                                      snapshot.data!.todayDeaths.toString()),
                              MyRow(
                                  situation: 'Today Recovered',
                                  noOfPatients:
                                      snapshot.data!.todayRecovered.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CountriesList())));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 52, 165, 55),
                            ),
                            child: const Center(
                              child: Text(
                                'Track Countries',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                })),
          ],
        ),
      ),
    );
  }
}
