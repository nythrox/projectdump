import 'package:flutter/material.dart';

class EventCountDown extends StatefulWidget {
  final DateTime date;

  EventCountDown(this.date);

  @override
  _EventCountDownState createState() => _EventCountDownState();
}

class _EventCountDownState extends State<EventCountDown> {
  Stream<int> _periodic;

  @override
  void initState() {
    _periodic = Stream.periodic(Duration(milliseconds: 1000), (i) => i);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _periodic,
        builder: (BuildContext context, snapshot) {
          int estimateTs = widget.date.millisecondsSinceEpoch;
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration restante = Duration(milliseconds: estimateTs - now);

          return restante.isNegative
              ? Container()
              : fimPromocao(context, restante);
        });
  }

  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  Widget fimPromocao(context, Duration restante) {
    String twoDigitDays = twoDigits(restante.inDays);
    String twoDigitHours =
        twoDigits(restante.inHours.remainder(Duration.hoursPerDay));
    String twoDigitMinutes =
        twoDigits(restante.inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds =
        twoDigits(restante.inSeconds.remainder(Duration.secondsPerMinute));

    return Container(
        padding: const EdgeInsets.only(
            top: 15.0, right: 15.0, left: 15.0, bottom: 15.0),
        decoration: BoxDecoration(color: Theme.of(context).accentColor),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('PROMOÇÃO ENCERRA EM:',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                infoPromocaoTermino(twoDigitDays, 'dias'),
                infoPromocaoTermino(twoDigitHours, 'horas'),
                infoPromocaoTermino(twoDigitMinutes, 'minutos'),
                infoPromocaoTermino(twoDigitSeconds, 'segundos'),
              ],
            ),
          ],
        ));
  }

  Widget infoPromocaoTermino(title, subtitle) {
    return Column(
      children: <Widget>[
        Text(title,
            style: TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        Text(subtitle.toUpperCase(),
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
