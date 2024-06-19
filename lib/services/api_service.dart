import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons()async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); // http.get 이 처리될 때 까지 대기

    if (response.statusCode == 200) { // Success
       print(response.body);
       return;
    }
    throw Error();
  }

}