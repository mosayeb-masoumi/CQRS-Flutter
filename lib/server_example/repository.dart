
import 'package:cqrs_examples/server_example/query.dart';

import 'data_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchDataQuery implements DataQuery {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<DataModel>> dataList() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((data) => DataModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
