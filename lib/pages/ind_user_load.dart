import 'package:flutter/material.dart';
import 'package:userassignment/data/data.dart';
import 'package:userassignment/pages/ind_user_page.dart';

class IndUserLoadPage extends StatefulWidget {
  final String user;
  const IndUserLoadPage({super.key, required this.user});

  @override
  State<IndUserLoadPage> createState() => _IndUserLoadPageState();
}

class _IndUserLoadPageState extends State<IndUserLoadPage> {
  bool _display = false;
  late Future result;
  Map data = {};

  @override
  void initState() {
    result = UsersData().gettingIndUserData(widget.user);
    result.then((userData) {
      setState(() {
        _display = true;
        data = userData;
      });
    }).catchError((error) {
      _display = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _display
          ? FutureBuilder(
              future: result,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return IndUserPage(data: data);
                }
              },
            )
          : const Center(child: CircularProgressIndicator()),
    ));
  }
}
