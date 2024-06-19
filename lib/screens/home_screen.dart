import 'package:flutter/material.dart';
import 'package:flutter_learning_webtoon_app/services/api_service.dart';
import '../models/webtoon_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    // Refresh StatefulWidget Ui -> restart build method
    setState(() {});
}

  @override
  void initState() { // build 호출 시 initState 실행
    super.initState();
    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
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
    );
  }
}
