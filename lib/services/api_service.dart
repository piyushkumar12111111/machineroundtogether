import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ApiService {
  static const String _baseUrl =
      'https://api-stg.together.buzz/mocks/discovery';

  Future<List<Item>> fetchItems({int page = 1, int limit = 10}) async {
    final response =
        await http.get(Uri.parse('$_baseUrl?page=$page&limit=$limit'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body)['data'] as List;
      return parsed.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
