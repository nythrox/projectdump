import 'package:trekkers/news/blocs/news_bloc.dart';
import 'package:trekkers/news/models/news.dart';
import 'package:trekkers/news/repositories/new_repository.dart';
import 'package:trekkers/news/views/ver_noticia.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/utils/network/utils.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  INewsBloc _newsBloc;

  @override
  void initState() {
    _newsBloc = NewsBloc(NewsRepository(CustomDio()));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 251, 253, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NOTÍCIAS",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      body: FutureBuilder<List<News>>(
          future: _newsBloc.news,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Ocorreu um erro'),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data.isEmpty) {
              return Center(
                child: Text("Ainda não há notícias"),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final item = snapshot.data[index];
                final events = GestureDetector(
                  onTap: () {
                    var route = MaterialPageRoute(
                      builder: (BuildContext context) =>
                          NewsDetailPage(news: item),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: NewsTile(
                    category: item.category,
                    title: item.title,
                    content: item.content,
                    createdDate: item.dateAdd,
                    image: item.cover,
                  ),
                );

                return Container(
                  child: events,
                );
              },
            );
          }),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String category;
  final String title;
  final String content;
  final String createdDate;
  final String image;

  const NewsTile({
    Key key,
    this.category,
    this.title,
    this.content,
    this.createdDate,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10.0, right: 10.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: <Widget>[
                                            Text((title != null) ? title : '',
                                                style: new TextStyle(
                                                    fontSize: 19,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ))),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  (title != null)
                                                      ? category.toUpperCase()
                                                      : '',
                                                  style: new TextStyle(
                                                      fontSize: 12.0,
                                                      color: Color.fromRGBO(
                                                          255, 184, 3, 1),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            )),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  (createdDate != null)
                                                      ? '   ' +
                                                          createdDate
                                                              .toUpperCase()
                                                      : '',
                                                  style: new TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ))
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: <Widget>[
                                          SingleChildScrollView(
                                            child: Html(
                                              data: content ?? '',
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
