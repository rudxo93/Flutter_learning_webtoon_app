import 'package:flutter/material.dart';
import 'package:flutter_learning_webtoon_app/screens/home_screen.dart';
import 'package:flutter_learning_webtoon_app/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
