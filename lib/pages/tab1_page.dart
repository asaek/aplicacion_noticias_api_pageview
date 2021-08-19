import 'package:flutter/material.dart';

import 'package:aplicacion_noticias_api_pageview/widgets/paginas.dart';
import 'package:aplicacion_noticias_api_pageview/widgets/navegacion_botton_navigator_bar.dart';

class Tap1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final newsService = Provider.of<NewService>(context);

    return Scaffold(
      body: Paginas(),
      bottomNavigationBar: Navegacion(),
    );
  }
}
