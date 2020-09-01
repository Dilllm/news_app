import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portal_berita/models/ResponseNews.dart';

String apiKey = "cddd7451f27a4028bcb3d91240d3ca96";

class News {
  Future<ResponseNews> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=id&category=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}
class NewsByCategory {
  Future<ResponseNews> getNewsByCategory(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=id&category=$category&" + "apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}
