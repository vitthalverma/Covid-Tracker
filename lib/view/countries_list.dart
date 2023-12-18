import 'package:api_demo/services/stats_services.dart';
import 'package:api_demo/view/detali_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  var searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statsService = StatsServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: ((value) {
                setState(() {});
              }),
              decoration: InputDecoration(
                hintText: 'Search for Countries',
                hintStyle:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: statsService.countriesListApi(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 5,
                          itemBuilder: ((context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: ListTile(
                                title: Container(
                                    width: 80, height: 10, color: Colors.white),
                                subtitle: Container(
                                    width: 80, height: 10, color: Colors.white),
                                leading: Container(
                                    width: 50, height: 50, color: Colors.white),
                              ),
                            );
                          }));
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            String name = snapshot.data![index]["country"];
                            if (searchController.text.isEmpty) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => DetailScreen(
                                                name: snapshot.data![index]
                                                    ["country"],
                                                image: snapshot.data![index]
                                                    ["countryInfo"]["flag"],
                                                totalCasesm: snapshot
                                                    .data![index]["cases"],
                                                totalDeaths: snapshot
                                                    .data![index]["deaths"],
                                                totalRecovered: snapshot
                                                    .data![index]["recovered"],
                                                active: snapshot.data![index]
                                                    ["active"],
                                                critical: snapshot.data![index]
                                                    ["critical"],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ["todayRecovered"],
                                                test: snapshot.data![index]
                                                    ["tests"],
                                              ))));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data![index]["country"],
                                  ),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  subtitle: Text('Total Cases' " " +
                                      snapshot.data![index]["cases"]
                                          .toString()),
                                  leading: Image(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"])),
                                ),
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => DetailScreen(
                                                name: snapshot.data![index]
                                                    ["country"],
                                                image: snapshot.data![index]
                                                    ["countryInfo"]["flag"],
                                                totalCasesm: snapshot
                                                    .data![index]["cases"],
                                                totalDeaths: snapshot
                                                    .data![index]["deaths"],
                                                totalRecovered: snapshot
                                                    .data![index]["recovered"],
                                                active: snapshot.data![index]
                                                    ["active"],
                                                critical: snapshot.data![index]
                                                    ["critical"],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ["todayRecovered"],
                                                test: snapshot.data![index]
                                                    ["tests"],
                                              ))));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]["country"]),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  subtitle: Text('Total Cases' " " +
                                      snapshot.data![index]["cases"]
                                          .toString()),
                                  leading: Image(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"])),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }));
                    }
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
