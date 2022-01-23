import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final String animal;
  final ImageProvider backgroundImage;
  final Iterable<String> requisitos;
  final String xp;
  final double progressIndicatorValue;

  const ProgressWidget(
      {this.backgroundImage,
      this.requisitos,
      this.xp,
      this.progressIndicatorValue,
      this.animal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundImage: backgroundImage,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 17.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(animal,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400))),
                    Container(
                      height: 10.0,
                      width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.only(top: 10.0, bottom: 7.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.black26,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.amberAccent[700]),
                        value: progressIndicatorValue,
                      ),
                    ),
                    Text(xp,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54)),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Pré Requisitos:",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (requisitos != null)
                      ...requisitos
                          .map((e) => Padding(
                            padding: const EdgeInsets.only(top:5),
                            child: Text(e,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black45)),
                          ))
                          .toList(),
                  ],
                ),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            "Saiba mais",
            style: TextStyle(fontSize: 18.0),
          ),
          trailing: Icon(Icons.add_circle_outline),
          initiallyExpanded: true,
          children: <Widget>[
            Container(
              height: 0.5,
              margin: EdgeInsets.only(bottom: 15.0),
              color: Colors.black,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium nibh ipsum consequat nisl vel pretium lectus. Hac habitasse platea dictumst vestibulum rhoncus est pellentesque.",
              style: TextStyle(fontSize: 15.0),
            )
          ],
        ),
        Container(
          height: 0.5,
          margin: EdgeInsets.only(top: 5, bottom: 25.0),
          color: Colors.black,
        ),
      ],
    );
  }
}
