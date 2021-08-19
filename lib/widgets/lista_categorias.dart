import 'package:aplicacion_noticias_api_pageview/models/category_models.dart';
import 'package:aplicacion_noticias_api_pageview/services/news_service.dart';
import 'package:aplicacion_noticias_api_pageview/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewService>(context).categorias;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _CategoryButton(categories[index]),
                SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewService>(context, listen: false);

    return GestureDetector(
      onTap: () {
        print('${categoria.name}');
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(categoria.icon,
            color: (categoria.name == newsService.selectedCategory)
                ? miTema.accentColor
                : Colors.black54),
      ),
    );
  }
}
