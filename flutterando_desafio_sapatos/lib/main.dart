import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterando_desafio_sapatos/components/ratingIconsWidget.dart';
import 'package:flutterando_desafio_sapatos/productModel.dart';
import 'package:flutterando_desafio_sapatos/userModel.dart';

import 'commentModel.dart';
import 'homeAnimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Demo',
      routes: {'hello': (context) => Text('i')},
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shop Items', items: 3),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.items}) : super(key: key);

  final String title;
  final int items;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin, HomeAnimation {
  @override
  Widget build(BuildContext context) {
    final key = ValueListenable;
    var controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    var animation = Tween(begin: 0, end: 10).animate(controller);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "${widget.title} (${widget.items})",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        // floatingActionButtonAnimator: ,
        floatingActionButton: Transform.translate(
          offset: Offset(0, 50),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, snapshot) {
              return Transform.translate(
                offset: Offset(0, animation.value.toDouble()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text("hi"),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, i) {
            if (i % 2 == 0) {
              return RightShoeWidget(Comment(
                  user: User(
                    name: "Ivascu Adrian",
                    profileUrl: "ble",
                  ),
                  product: Product(
                      title: "Nike Jordan III",
                      rating: 4.6,
                      sales: 1361,
                      profit: 13000,
                      imageUrl:
                          "https://rukminim1.flixcart.com/image/714/857/jao8uq80/shoe/3/r/q/sm323-9-sparx-white-original-imaezvxwmp6qz6tg.jpeg?q=50"),
                  comment:
                      "The shoes were shipped one day before the shipping date, but this...",
                  rating: 4));
            } else {
              return LeftShoeWidget(Comment(
                  user: User(
                    name: "Adriano Salves",
                    profileUrl: "ble",
                  ),
                  product: Product(
                      title: "Nike Jordan III",
                      rating: 1.6,
                      sales: 301,
                      profit: 1000,
                      imageUrl:
                          "https://rukminim1.flixcart.com/image/714/857/jao8uq80/shoe/3/r/q/sm323-9-sparx-white-original-imaezvxwmp6qz6tg.jpeg?q=50"),
                  comment:
                      "The toys were shipped one day before the shipping date, but this...",
                  rating: 1));
            }
          },
        ));
  }
}

class RightShoeWidget extends StatelessWidget {
  final Comment comment;
  RightShoeWidget(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 130, top: 0),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(100, 100, 200, 0.25),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: 5)
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(comment.product.title,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
                Row(children: <Widget>[
                  Text(
                    comment.product.rating.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.star)
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text("Bought "),
                    Text(
                      comment.product.sales.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(" times for a profit of"),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          // "\$ 13k",
                          comment.product.profit.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -20,
            right: 20,
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(100, 100, 250, 0.15),
                          blurRadius: 7,
                          offset: Offset(0, 7),
                          spreadRadius: 7)
                    ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Center(
                        child: Image.network(comment.product.imageUrl)))),
          ),
          Positioned(
            bottom: -80,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.lightGreenAccent
                  ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(100, 100, 100, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 6),
                        spreadRadius: 10)
                  ]),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: Colors.purple, shape: BoxShape.circle),
                      child: Text(
                        "Al",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text(comment.user.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                          RatingIconsWidget(
                            comment.rating,
                            size: 15,
                          )
                        ]),
                        Text(
                          comment.comment,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(50, 50, 50, 1.0)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LeftShoeWidget extends StatelessWidget {
  final Comment comment;
  LeftShoeWidget(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 200, top: 0),
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.deepPurple]),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(100, 100, 200, 0.25),
                          blurRadius: 10,
                          offset: Offset(0, 10),
                          spreadRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(comment.product.title,
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Row(children: <Widget>[
                      Text(
                        comment.product.rating.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.star, color: Colors.yellow)
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Bought ", style: TextStyle(color: Colors.white)),
                        Text(
                          comment.product.sales.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text("times for a profit of",
                            style: TextStyle(color: Colors.white)),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              // "\$ 13k",
                              comment.product.profit.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: -20,
                right: 20,
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(100, 100, 250, 0.15),
                              blurRadius: 7,
                              offset: Offset(0, 7),
                              spreadRadius: 7)
                        ]),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Center(
                            child: Image.network(comment.product.imageUrl)))),
              ),
              Positioned(
                bottom: -80,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(100, 100, 100, 0.15),
                            blurRadius: 10,
                            offset: Offset(0, 6),
                            spreadRadius: 10)
                      ]),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              color: Colors.purple, shape: BoxShape.circle),
                          child: Text(
                            "Al",
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text(comment.user.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17)),
                              Icon(Icons.star, size: 20),
                              Icon(Icons.star_border, size: 20),
                              Icon(Icons.star_border, size: 20),
                              Icon(Icons.star_border, size: 20),
                              Icon(Icons.star_border, size: 20),
                            ]),
                            Text(
                              comment.comment,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(50, 50, 50, 1.0)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
