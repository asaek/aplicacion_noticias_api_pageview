import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:aplicacion_noticias_api_pageview/pages/tab1_page.dart';
import 'package:aplicacion_noticias_api_pageview/providers/provider.dart';
import 'package:aplicacion_noticias_api_pageview/services/news_service.dart';
import 'package:aplicacion_noticias_api_pageview/theme/tema.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NavegacinMoodel()),
        ChangeNotifierProvider(create: (_) => new NewService()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Material App',
        home: Tap1Page());
  }
}
