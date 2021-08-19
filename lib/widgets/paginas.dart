import 'package:aplicacion_noticias_api_pageview/pages/tab2_page.dart';
import 'package:aplicacion_noticias_api_pageview/providers/provider.dart';
import 'package:aplicacion_noticias_api_pageview/services/news_service.dart';
import 'package:aplicacion_noticias_api_pageview/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionmodel = Provider.of<NavegacinMoodel>(context);
    // final newsService = Provider.of<NewService>(context);
    final headlines = Provider.of<NewService>(context).headlines;

    return (headlines.length == 0)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : PageView(
            // physics: BouncingScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            controller: navegacionmodel.pageController,
            children: <Widget>[
              ListaNoticias(headlines),
              Tap2Page(),
            ],
          );
  }
}
