import 'package:aplicacion_noticias_api_pageview/services/news_service.dart';
import 'package:aplicacion_noticias_api_pageview/widgets/lista_categorias.dart';
import 'package:aplicacion_noticias_api_pageview/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tap2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsSerice =
        Provider.of<NewService>(context).getArticulosCategoriaSeleccionada;
    final headlines = Provider.of<NewService>(context).headlines;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            ListaCategorias(),
            Expanded(
              child: ListaNoticias(newsSerice!),
            )
          ],
        ),
      ),
    );
  }
}
