import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:trekkers/events/blocs/event_detail_page_bloc.dart';
import 'package:trekkers/events/components/event_countdown.dart';
import 'package:trekkers/events/components/event_detail.dart';
import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/events/models/waiting_list_dto.dart';
import 'package:trekkers/events/repositories/event_repository.dart';
import 'package:trekkers/shared/components/event_tile.dart';
import 'package:trekkers/shared/components/success_page.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/ticket/views/tickets_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/widgets/custo_progress_indicator.dart';
import 'package:trekkers/widgets/hero_header.dart';

class EventDetailPage extends StatefulWidget {
  final Event eventData;

  EventDetailPage({Key key, this.eventData}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  EventDetailPageBloc _eventDetailPageBloc;

  @override
  void initState() {
    super.initState();
    _eventDetailPageBloc =
        EventDetailPageBloc(widget.eventData.id, EventRepository(CustomDio()));
    _eventDetailPageBloc.response.listen(
        (e) => showDialog(
            context: context,
            builder: (context) => SuccessPage(
                  function: () {
                    Navigator.of(context).pop();
                  },
                  text: e,
                )),
        onError: (e) => showErrorDialog(e));
  }

  @override
  void dispose() {
    _eventDetailPageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  void showErrorDialog(error) {
    String message =
        "Ocorreu algum erro ao tentar te adicionar na lista de espera. Por favor tente novamente.";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro!'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder<EventDetail>(
      future: _eventDetailPageBloc.eventDetails,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[CustomProgressIndicator()]);
          default:
            if (snapshot.hasError) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Text("Erro ao carregar Eventos"),
                    Text(snapshot.error.toString())
                  ],
                ),
              );
            } else {
              if (snapshot.hasData && snapshot.data.info.length > 0) {
                return CustomScrollView(
                  slivers: <Widget>[
                    _sliverHeader(context),
                    _sliverPromocao(context),
                    _sliverList(context, snapshot.data.info),
                  ],
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.assignment_late,
                        size: 120,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Nenhum detalhe sobre o evento!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                );
              }
            }
        }
      },
    );
  }

  Widget _sliverHeader(BuildContext context) {
    Widget header = Stack(
      children: <Widget>[
        EventTile(
          eventData: widget.eventData,
          height: 214,
        ),
        StreamBuilder<bool>(
          stream: _eventDetailPageBloc.waitingListLoading,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Center(child: CircularProgressIndicator())
                ],
              );
            // return Container();
            return Container();
          },
        ),
        Positioned(
          bottom: 0,
          right: 16,
          child: MaterialButton(
            onPressed: () {
              if (widget.eventData.status == 2)
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => TicketsPage(),
                  ),
                );
              else
                //TODO: ---------------------------------------\/ GET ID FROM CURRENT LOGGED IN USER
                _eventDetailPageBloc
                    .waitingList(WaitingListDto(1, widget.eventData.id));
            },
            child: Text(
              widget.eventData.status == 2
                  ? "Participar"
                  : "Entrar na lista de espera",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            color: Theme.of(context).primaryColor,
            height: 23,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ],
    );

    return SliverPersistentHeader(
      pinned: true,
      delegate: HeroHeader(minExtent: 214, maxExtent: 214, content: header),
    );
  }

  Widget _sliverPromocao(BuildContext context) {
    var date = DateTime.parse(widget.eventData.startDate);
    return SliverToBoxAdapter(
      child: EventCountDown(date),
    );
  }

  Widget _sliverList(BuildContext context, List<Info> infoList) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ExpansionTile(
          title: Text(
            infoList[index].title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87),
          ),
          trailing: Icon(Icons.add_circle_outline),
          initiallyExpanded: index == 0,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(infoList[index].title,
                  style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      );
    }, childCount: infoList.length));
  }
}
