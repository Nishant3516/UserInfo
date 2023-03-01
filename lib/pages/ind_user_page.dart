import 'package:flutter/material.dart';

class IndUserPage extends StatelessWidget {
  final data;
  const IndUserPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final mainWidth = MediaQuery.of(context).size.width * 0.9;
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: const Text(
                  "User Details",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CircleAvatar(
                    radius: 50,
                    child: Text(
                      data["username"].toString().substring(0, 1),
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: mainWidth * 0.4,
                      child: const Text(
                        "ID",
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                      width: mainWidth * 0.6,
                      child: Text(
                        "${data["id"]}",
                        style: const TextStyle(fontSize: 24),
                      ))
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: mainWidth * 0.4,
                      child: const Text(
                        "Username",
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                      width: mainWidth * 0.6,
                      child: Text(
                        "${data["username"]}",
                        style: const TextStyle(fontSize: 24),
                      ))
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: mainWidth * 0.4,
                      child: const Text(
                        "Name",
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                      width: mainWidth * 0.6,
                      child: Text(
                        "${data["name"]}",
                        style: const TextStyle(fontSize: 24),
                      ))
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: mainWidth * 0.4,
                      child: const Text(
                        "Email",
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                      width: mainWidth * 0.6,
                      child: Text(
                        "${data["email"]}",
                        style: const TextStyle(fontSize: 24),
                      ))
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: mainWidth * 0.4,
                      child: const Text(
                        "Address",
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                      width: mainWidth * 0.6,
                      child: Text(
                        "${data["address"]["street"]}, ${data["address"]["city"]}- ${data["address"]["zipcode"]}",
                        style: const TextStyle(fontSize: 24),
                      ))
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: mainWidth * 0.4,
                      child: const Text(
                        "Phone",
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                      width: mainWidth * 0.6,
                      child: Text(
                        "${data["phone"]}",
                        style: const TextStyle(fontSize: 24),
                      ))
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: mainWidth * 0.4,
                      child: const Text(
                        "Website",
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                      width: mainWidth * 0.6,
                      child: Text(
                        "${data["website"]}",
                        style: const TextStyle(fontSize: 24),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
