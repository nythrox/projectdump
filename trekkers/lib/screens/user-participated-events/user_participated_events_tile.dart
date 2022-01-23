import 'package:trekkers/events/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trekkers/screens/user-participated-events/models/event_user_participated.dart';
import 'package:trekkers/utils/network/utils.dart';
import 'package:transparent_image/transparent_image.dart';

class UserParticipatedEventTile extends StatelessWidget {
  final EventUserParticipated eventUserParticipated;
  final double height;
  final Function onTap;

  const UserParticipatedEventTile({Key key, this.eventUserParticipated, this.height = 162, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider widgetImage =
        Image.network('https://placeimg.com/640/480/any', fit: BoxFit.fill)
            .image;

    if (eventUserParticipated.cover.isNotEmpty)
      widgetImage = FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: '${NetworkUtils.urlBase}' + eventUserParticipated.cover,
              fit: BoxFit.cover)
          .image;

    Widget texto1 = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          eventUserParticipated.startDate.day ?? "",
          style: const TextStyle(
            fontSize: 33,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          eventUserParticipated.startDate.month ?? "",
          style: const TextStyle(
              height: 0.6,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              color: Colors.yellow),
        ),
      ],
    );

    Widget texto2 = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text((eventUserParticipated.title ?? "").toUpperCase(),
            style: const TextStyle(
                fontSize: 11.0,
                fontFamily: 'Roboto',
                color: Colors.yellow,
                fontWeight: FontWeight.w500)),
        Text('${eventUserParticipated.categoryId}',
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            )),
      ],
    );

    Widget card = Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: texto1,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16),
                child: texto2,
              ),
            )
          ],
        ),
      ],
    ));

    Widget tile = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: widgetImage,
        fit: BoxFit.cover,
      )),
      height: this.height,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          SafeArea(
            child: card,
          ),
        ],
      ),
    );


    return Container(
      child: GestureDetector(onTap:onTap, child: tile),
    );
  }
}
