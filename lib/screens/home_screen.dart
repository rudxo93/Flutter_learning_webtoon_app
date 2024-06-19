import 'package:flutter/material.dart';
import 'package:flutter_learning_webtoon_app/services/api_service.dart';
import '../models/webtoon_model.dart';

/// const - 컴파일 전에 값을 알고있을때 사용..(Future에 요청하는 데이터 이므로 const 가 될 수 없다)
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        // 하단 음영
        centerTitle: true,
        backgroundColor: Colors.white,
        // 배경
        foregroundColor: Colors.green,
        // text Color

        title: const Text(
          '오늘의 웹툰s',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // snapshot이 데이터를 가지고 있을때만 실행되면 된다... -> future 동작이 끝나고 서버가 응답했을 때!
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      // ListView.builder -> 사용자가 보는 item만 build! <-> 사용자가 볼 수 없는 아이템은 build하지 않는다. -> 앱 메모리 릭을 방지하기 위해 최적화된 방법
      scrollDirection: Axis.horizontal, // 수평 스크롤
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
        // 만들려는 item에 itemBuild 실행
        var webtoon = snapshot.data![index];
        return Column(
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
              child: Image.network(webtoon.thumb),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: TextStyle(
                fontSize: 22,
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
