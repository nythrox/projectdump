import 'package:flutter/material.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxFourWidget.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxThreeWidget.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxTwoWidget.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxOneWidget.dart';

class LessonWidget extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  LessonWidget(this.title, this.widgets);

  final PageController controller = new PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 66.0),
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                bool isLast = false;

                if (index == widgets.length - 1) {
                  isLast = true;
                }

                if (widgets[index] is TextCheckboxOneWidget) {
                  return TextCheckboxOneWidget(
                    (widgets[index] as TextCheckboxOneWidget).content,
                    (widgets[index] as TextCheckboxOneWidget).answer,
                    (widgets[index] as TextCheckboxOneWidget).title,
                    (widgets[index] as TextCheckboxOneWidget).subtitle,
                    (widgets[index] as TextCheckboxOneWidget).options,
                    controller: controller,
                    isLastChild: isLast,
                  );
                }
                else if (widgets[index] is TextCheckboxTwoWidget) {
                  return TextCheckboxTwoWidget(
                    (widgets[index] as TextCheckboxTwoWidget).content,
                    (widgets[index] as TextCheckboxTwoWidget).answer,
                    (widgets[index] as TextCheckboxTwoWidget).title,
                    (widgets[index] as TextCheckboxTwoWidget).subtitle,
                    (widgets[index] as TextCheckboxTwoWidget).options,
                    controller: controller,
                    isLastChild: isLast,
                  );
                }
                else if (widgets[index] is TextCheckboxThreeWidget) {
                  return TextCheckboxThreeWidget(
                    (widgets[index] as TextCheckboxThreeWidget).content,
                    (widgets[index] as TextCheckboxThreeWidget).answer,
                    (widgets[index] as TextCheckboxThreeWidget).title,
                    (widgets[index] as TextCheckboxThreeWidget).subtitle,
                    (widgets[index] as TextCheckboxThreeWidget).options,
                    controller: controller,
                    isLastChild: isLast,
                  );
                }
                
                else if (widgets[index] is TextCheckboxFourWidget) {
                  return TextCheckboxFourWidget(
                    (widgets[index] as TextCheckboxFourWidget).content,
                    (widgets[index] as TextCheckboxFourWidget).answer,
                    (widgets[index] as TextCheckboxFourWidget).title,
                    (widgets[index] as TextCheckboxFourWidget).subtitle,
                    (widgets[index] as TextCheckboxFourWidget).options,
                    controller: controller,
                    isLastChild: isLast,
                  );
                }
                else {
                  return widgets[index];
                }
              },
              itemCount: widgets.length,
              controller: controller,
              pageSnapping: true,
              scrollDirection: Axis.vertical,
            ),
          ),
          GradientAppBar(title),
        ],
      ),
    );
    //return createWidgets()[0];
  }

  // List<TextwidgetsWidget> createWidgets() {
  //   List<TextwidgetsWidget> finalList = new List<TextwidgetsWidget>(widgets.length);
  //   for (int i = widgets.length - 1; i >= 0; i--) {
  //     if (i == widgets.length - 1) { //if its the first i (last post)
  //       finalList[i] = TextwidgetsWidget(widgets[i].widgets); //add a link to Lesson
  //     } else {
  //       finalList[i] = TextwidgetsWidget(
  //         widgets[i].widgets,
  //         link: finalList[i + 1],
  //       );
  //     }
  //   }
  //   return finalList;
  // }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double size = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarSize = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarSize, right: 20, left: 20),
      height: statusBarSize + size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7))),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xFF00CCFF),
          gradient: LinearGradient(
              colors: [const Color(0xFFF8F8F8), const Color(0xFFF8F8F8)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
    );
  }
}
