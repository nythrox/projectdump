import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TextContentWidget extends StatelessWidget {
  final String content;

  final Widget link;
  final PageController controller;
  final bool isLastChild;

  TextContentWidget(this.content, {this.link, this.controller, this.isLastChild});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
        Padding(
          padding: EdgeInsets.only(right: 15, left: 15, top: 10,bottom: 0),
          child: Html(
              data: "$content",
              linkStyle: const TextStyle(
                color: Colors.redAccent,
              ),
              defaultTextStyle: TextStyle(fontSize: 22),
              onLinkTap: (url) {
                // open url in a webview
              }),
             ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end  ,
        //   children: <Widget>[
        //     MaterialButton(
        //       onPressed: (){
        //         if (isLastChild == true) {
        //           Navigator.pop(context);
        //         }
        //         else {
        //           controller.nextPage(duration: Duration(milliseconds: 200),curve: Curves.ease);
        //         }
        //         // if (link != null) {
        //         //   Route route = MaterialPageRoute(builder: (context) => link);
        //         //   Navigator.push(context, route);
        //         // }  
        //       },
        //       padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        //       child: Text(
        //         "Confirm",
        //         style: TextStyle(
        //             fontSize: 22, color: Colors.white, fontWeight: FontWeight.w900),
        //       ),
        //       color: Colors.indigoAccent,
        //     ),
        //   ],
        // )
      
    );
  }
}
