import 'package:flutter/material.dart';
import 'package:userassignment/data/data.dart';
import 'package:userassignment/pages/ind_user_load.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _display = false;
  bool boolSort = true;
  List<String> data = [];
  final result = UsersData().gettingUsersData();

  @override
  void initState() {
    result.then((userNames) {
      // Do something with the user names
      setState(() {
        _display = true;
        data = userNames;
      });
    }).catchError((error) {
      // Handle the error
      _display = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          actions: [
            GestureDetector(
              onTap: () {
                boolSort
                    ? setState(() {
                        data.sort((a, b) => a.compareTo(b));
                        boolSort = false;
                      })
                    : setState(() {
                        data.sort((a, b) => b.compareTo(a));
                        boolSort = true;
                      });
              },
              child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.sort_by_alpha)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Container(
              child: _display
                  ? FutureBuilder(
                      future: result,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "Loading...",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text("Please check your Internet connectivity!!",
                                  style: TextStyle(fontSize: 18)),
                            ],
                          );
                        } else {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return IndUserLoadPage(
                                      user: data[index],
                                    );
                                  }));
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      data[index],
                                      style: const TextStyle(
                                          fontSize: 24, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )),
                              );
                            },
                          );
                        }
                      },
                    )
                  : const SizedBox(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
