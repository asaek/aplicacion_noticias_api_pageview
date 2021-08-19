import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:aplicacion_noticias_api_pageview/models/category_models.dart';
import 'package:aplicacion_noticias_api_pageview/models/news_notice_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '6ff70169fbe54cc687efb6f777b7c6e9';

class NewService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categorias = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewService() {
    this.getTopHeadlines();

    categorias.forEach((element) {
      this.categoryArticles[element.name] = [];
      // this.categoryArticles[element.name] = new List.empty();
    });
  }

  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async {
    print('Cargando........ noticias');

    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    final resp = await http.get(Uri.parse(url));
    print(resp.body);
    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category]!.length > 0) {}

    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category=$category';
    final resp = await http.get(Uri.parse(url));
    print(resp.body);

    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}
