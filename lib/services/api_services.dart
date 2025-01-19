import 'dart:convert';

import 'package:http/http.dart' as http;
import '../utils/debug_purpose.dart';
import '../models/quiz.dart';

class ApiService {
  static const String apiUrl = 'https://api.jsonserve.com/Uw5CrX';

  Future<Quiz> fetchQuizData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData.isNotEmpty) {
          return Quiz.fromJson(jsonData);
        } else {
          throw Exception('No questions available in the response');
        }
      } else {
        printYellow('line 45 passed');
        throw Exception(
            'Something went wrong. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error for better understanding of the issue
      throw Exception('Error fetching quiz data: $e');
    }
  }
}
