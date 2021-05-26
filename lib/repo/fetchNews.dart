import 'dart:convert' ;
import 'package:fellotask/model/newsModel.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'https://api.spaceflightnewsapi.net/v3/articles?_start=';

Future<List<Newapi>?> getNewsData(start) async {
  List<Newapi> news = [];
  var response = await http.get(Uri.parse(
    baseUrl + '$start'
  ));
  String responeBody = response.body;
  var jsonBody = json.decode(responeBody);
  if (response.statusCode == 200) {
    print(jsonBody);
    for(var json in jsonBody ){
      news.add(Newapi(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        imageUrl: json["imageUrl"],
        newsSite: json["newsSite"],
        summary: json["summary"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        featured: json["featured"],
      ));
    }
    //print(news);
    return news;
  }
}