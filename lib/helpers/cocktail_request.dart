import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> request(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);

    if (data.containsKey('drinks') && data['drinks'] != null) {
      return List<Map<String, dynamic>>.from(data['drinks']);
    } else {
      return [];
    }
  } else {
    throw Exception('Something went wrong ${response.statusCode} $url');
  }
}
