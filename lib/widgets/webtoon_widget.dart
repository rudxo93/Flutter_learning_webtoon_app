import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_webtoon_app/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // 동작을 감지하는 widget
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(
                      title: title,
                      thumb: thumb,
                      id: id
                  ),
              fullscreenDialog: true, // 밑에서부터 올라오는 효과 / 좌측 상단 아이콘도 arrow -> cancel image 변경됨
            )
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
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
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
