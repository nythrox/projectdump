import 'package:trekkers/events/blocs/event_bloc.dart';
import 'package:trekkers/events/blocs/ievent_bloc.dart';
import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/events/repositories/event_category_repository.dart';
import 'package:trekkers/events/repositories/event_repository.dart';
import 'package:trekkers/events/views/ver_evento.dart';
import 'package:trekkers/shared/components/category_page.dart';
import 'package:trekkers/shared/components/event_tile.dart';
import 'package:trekkers/shared/components/menu.dart';
import 'package:trekkers/shared/models/category.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/widgets/nenhum_registro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// cores
//amarelo opaco, usado na bottomBar
const opaqueYellow = Color.fromRGBO(247, 183, 44, 1);

// amarelo tema do app
const yellow = Color.fromRGBO(249, 250, 57, 1);

//

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key key}) : super(key: key);
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  IEventBloc _eventBloc;

  @override
  void initState() {
    _eventBloc = EventBloc(
      EventRepository(
        CustomDio(),
      ),
      CategoryRepository(
        CustomDio(),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: _eventBloc.eventCategories,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "EVENTOS",
                style: TextStyle(fontSize: 17),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
            ),
            body: const Center(
              child: Text("Ocorreu um erro"),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "EVENTOS",
                style: TextStyle(fontSize: 17),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return DefaultTabController(
          length: snapshot.data.length,
          child: Scaffold(
            drawer: MenuDrawer(),
            appBar: AppBar(
              title: const Text(
                "EVENTOS",
                style: TextStyle(fontSize: 17),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  height: 40,
                  color: opaqueYellow,
                  child: TabBar(
                    isScrollable: snapshot.data.length > 3,
                    tabs: snapshot.data
                        .map((e) => Tab(
                              child: Text(e.title),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: snapshot.data
                  ?.map(
                    (e) => CategoryPage<List<Event>>(
                      future: () async => _eventBloc.findEventsByCategory(e.id),
                      builder: (_, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Ocorreu um erro ao pesquisar trilhas"),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data.isEmpty) {
                          return const Center(
                            child: EmptyItems(
                              text: "Ainda não existem trilhas cadastradas",
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) {
                            final item = snapshot.data[index];
                            return EventTile(
                              onTap: () {
                                var route = MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EventDetailPage(
                                    eventData: item,
                                  ),
                                );
                                Navigator.of(context).push(route);
                              },
                              eventData: item,
                            );
                          },
                        );
                      },
                    ),
                  )
                  ?.toList(),
            ),
          ),
        );
      },
    );
  }
}
