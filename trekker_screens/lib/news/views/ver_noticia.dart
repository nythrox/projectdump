import 'dart:convert';

import 'package:trekkers/news/models/news.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/utils/network/utils.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsDetailPage extends StatefulWidget {
  final News news;

  NewsDetailPage({Key key, this.news}) : super(key: key);
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "NOTÍCIAS",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      body: conteudo(context, widget.news.category, widget.news.title,
          widget.news.content, widget.news.dateAdd, widget.news.cover),
    );
  }

  Widget conteudo(context, category, title, content, dateAdd, image) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: (image != null && image != '')
                  ? '${NetworkUtils.urlImage}' + image
                  : '${NetworkUtils.urlBase}img/default-placeholder.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          Text((title != null && title != '') ? title : '',
                              style: new TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    (category != null && category != '')
                                        ? category.toUpperCase()
                                        : '',
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(255, 184, 3, 1),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    (dateAdd != null && dateAdd != '')
                                        ? '   ' + dateAdd.toUpperCase()
                                        : '',
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ))
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Html(
                                //@todo resolver questão de deixar somente uma parte
                                data: (content != null && content != '')
                                    ? content
                                    : '',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
