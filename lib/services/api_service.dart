import 'dart:convert';

import 'package:flutter_learning_webtoon_app/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); // http.get 이 처리될 때 까지 대기

    if (response.statusCode == 200) { // Success
      final List<dynamic> webtoons = jsonDecode(response.body); // json Decode

      for(var webtoon in webtoons) {
        print(webtoon);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    throw Error();
  }

}