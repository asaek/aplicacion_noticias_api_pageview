import 'package:flutter/material.dart';

class NavegacinMoodel with ChangeNotifier {
  int _paginaActual = 0;
  int get paginaActual => this._paginaActual;

  PageController _pageController = new PageController();

  set paginaActual(int pagina) {
    this._paginaActual = pagina;
    _pageController.animateToPage(pagina,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
