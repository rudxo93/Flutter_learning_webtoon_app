import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
