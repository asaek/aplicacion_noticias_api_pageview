import 'package:flutter/material.dart';

import 'package:aplicacion_noticias_api_pageview/models/news_notice_models.dart';
import 'package:aplicacion_noticias_api_pageview/theme/tema.dart';

class ListaNoticias extends StatefulWidget {
  final List<Article> noticias;
  const ListaNoticias(this.noticias);

  @override
  _ListaNoticiasState createState() => _ListaNoticiasState();
}

class _ListaNoticiasState extends State<ListaNoticias>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return Noticia(noticia: this.widget.noticias[index], index: index);
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TarjetaTopbar(
          noticia: noticia,
          index: index,
        ),
        TarjetaTitulo(
          noticia: noticia,
        ),
        TarjetaImagen(
          noticia: noticia,
          index: index,
        ),
        TarjetaBody(
          noticia: noticia,
          index: index,
        ),
        TarjetaBotones(
          noticia: noticia,
          index: index,
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.deepOrangeAccent,
          indent: 5,
          endIndent: 5,
        )
      ],
    );
  }
}

class TarjetaBotones extends StatelessWidget {
  final Article noticia;
  final int index;

  const TarjetaBotones({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border_outlined),
          ),
          SizedBox(
            width: 30,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.deepPurpleAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.add_alarm_outlined),
          ),
        ],
      ),
    );
  }
}

class TarjetaBody extends StatelessWidget {
  final Article noticia;
  final int index;
  const TarjetaBody({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          (noticia.description != 'null')
              ? noticia.description
              : 'Una Disculpa no hay descripcion :(',
          textAlign: TextAlign.justify,
        ));
  }
}

class TarjetaImagen extends StatelessWidget {
  final Article noticia;
  final int index;
  const TarjetaImagen({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: Container(
            child: (noticia.urlToImage != 'null')
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage))
                : Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}

class TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  const TarjetaTitulo({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class TarjetaTopbar extends StatelessWidget {
  final Article noticia;
  final int index;
  const TarjetaTopbar({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}',
            style: TextStyle(color: miTema.accentColor),
          ),
          Text(
            '${noticia.source.name}',
          ),
        ],
      ),
    );
  }
}

 

// class ListaNoticias extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final headlines = Provider.of<NewService>(context).headlines;
//     // final newsService = Provider.of<NewService>(context);

//     return ListView.builder(
//       itemCount: headlines.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Text(headlines[index].title);
//       },
//     );
//   }
// }