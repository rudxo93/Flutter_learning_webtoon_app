import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        // 하단 음영
        centerTitle: true,
        backgroundColor: Colors.white, // 배경
        foregroundColor: Colors.green, // text Color 및 좌측에 위치한 아이콘 색상도 반영

        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                clipBehavior: Clip.hardEdge, // 자식의 부모 영역 침범 제어
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          offset: Offset(10, 10),
                          color: Colors.black.withOpacity(0.5))
                    ]),
                child: Image.network(thumb),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
