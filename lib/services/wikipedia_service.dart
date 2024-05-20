import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:visual_dictionary/constants/api_constants.dart';
import 'package:visual_dictionary/models/responses/wikipedia_summary.dart';

class WikipediaService {
  Future<WikipediaSummary> fetchDescription(String searchParameter) async {
    final response = await http.get(
      Uri.parse(
          "${ApiConstants.WIKIPEDIA_BASE_URL}page/summary/$searchParameter"),
    );

    if (response.statusCode == 200) {
      return WikipediaSummary.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
