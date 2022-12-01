import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dataclases.dart';

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/restaurants'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse["data"]["data"];
      return data.map((data) => cData.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
