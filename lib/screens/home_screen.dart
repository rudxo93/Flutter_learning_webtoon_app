import 'package:flutter/material.dart';
import 'package:flutter_learning_webtoon_app/services/api_service.dart';
import '../models/webtoon_model.dart';

/// const - 컴파일 전에 값을 알고있을때 사용..(Future에 요청하는 데이터 이므로 const 가 될 수 없다)
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // 하단 음영
        centerTitle: true,
        backgroundColor: Colors.white, // 배경
        foregroundColor: Colors.green, // text Color

        title: const Text('오늘의 웹툰s', style:
        TextStyle(
            fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('there is data!');
          }
          return const Text('Loading.....');
        },
      ),
    );
  }
}
