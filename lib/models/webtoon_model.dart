class WebtoonModel {
  final String title, thumb, id;

  /*{id: 823195, title: 쌉초의 난, thumb: https://image-comic.pstatic.net/webtoon/823195/thumbnail/thumbnail_IMAG21_10484673-5368-4f70-9ef0-9950f426b5a8.jpg}*/

  // Constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
