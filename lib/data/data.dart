import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersData {
  Future<List<String>> gettingUsersData() async {
    String url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<String> data =
          responseData.map((user) => user['name'] as String).toList();
      return data;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<Map> gettingIndUserData(String name) async {
    String url = 'https://jsonplaceholder.typicode.com/users?name=$name';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData[0];
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
