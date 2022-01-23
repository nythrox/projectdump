import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxFourWidget.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxOneWidget.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxThreeWidget.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxTwoWidget.dart';

import 'package:goodstart_app/widgets/Levels/LevelName.dart';
import 'package:goodstart_app/widgets/Levels/LevelWidget.dart';

import 'package:goodstart_app/widgets/Lessons/LessonWidget.dart';
import 'package:goodstart_app/widgets/Lessons/LessonName.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new AppHomepage(),
    );
  }
}

class AppHomepage extends StatelessWidget {
//create list of models (TextContent and CheckboxExercise)
  static List<Widget> lessonContentall = [
    TextCheckboxOneWidget(
      """<h1>O cachorro da Ana</h1><p>Ana foi visitar o vizinho junto com o cachorro dela, que tinha 21 anos. A vizinha disse para ela:<br>"Oi cachorra!" <br>A Ana, confusa, ficou brava e saiu andando. A vizinha então disse para o cachorro:<br>"Parece que a cachorra saiu correndo!"</p>""",2,"Question One","Choose the gramatically correct word",
      ["Ana tem 21 anos.","O cachorro da ana tem 21 anos.","Ana é uma cachorra.",]),
    TextCheckboxTwoWidget(
      """<h1>O cachorro da Ana</h1><p>Ana foi visitar o vizinho junto com o cachorro dela, que tinha 21 anos. A vizinha disse para ela:<br>"Oi cachorra!" <br>A Ana, confusa, ficou brava e saiu andando. A vizinha então disse para o cachorro:<br>"Parece que a cachorra saiu correndo!"</p>""",2,"Question One","Choose the gramatically correct word",
      ["Right","Left"]),
    TextCheckboxThreeWidget(
      """<h1>Choose the gramatically correct word</h1>""",1,"Question One","Qual som faz o th?",
      ["sss","hhhh","fff",]),
    TextCheckboxFourWidget("""<h1>Choose the gramatically correct word</h1>""",1,"Question One","Choose the gramatically correct word",
        ["gado","boy","boi","boe",]),
    // TextContent("""<h1>Post one</h1>Dismiss. All your code in one place. GitHub makes it easy to scale back on context switching. Read rendered documentation, see the history of any file...<br>A text only node is a child of a tag with no inner html."""),
    //CheckboxWidget(options:["bye","boy","boi",]),
  ];

static List<Widget> lessonContent1 = [TextCheckboxTwoWidget("""<h1>This is me with my family. I am a parent and I am married. I am very happy today. The family is together. It is a special day. It is my daughter's birthday. My hair is blond and my eyes are blue. My daughter is with her son. I am a grandmother and I am very proud of my grandson.</h1>""",1,"Question One","It's my grandson’s birthday.",["Right","Wrong"]),TextCheckboxTwoWidget("""<h1>This is me with my family. I am a parent and I am married. I am very happy today. The family is together. It is a special day. It is my daughter's birthday. My hair is blond and my eyes are blue. My daughter is with her son. I am a grandmother and I am very proud of my grandson.</h1>""",0,"Question Two","I'm happy.",["Right","Wrong"]),];
static List<Widget> lessonContent2 = [TextCheckboxTwoWidget("""<h1>O cachorro da Ana</h1><p>Ana foi visitar o vizinho junto com o cachorro dela, que tinha 21 anos. A vizinha disse para ela:<br>"Oi cachorra!" <br>A Ana, confusa, ficou brava e saiu andando. A vizinha então disse para o cachorro:<br>"Parece que a cachorra saiu correndo!"</p>""",2,"Question One","Choose the gramatically correct word",["Right","Left"]),];
static List<Widget> lessonContent3 = [TextCheckboxThreeWidget("""<h1>Choose the gramatically correct word</h1>""",1,"Question One","Qual som faz o th?",["sss","hhhh","fff",]),];
static List<Widget> lessonContent4 = [TextCheckboxFourWidget("""<h1>Choose the gramatically correct word</h1>""",1,"Question One","Choose the gramatically correct word",["gado","boy","boi","boe",]),];

  
  
  static LevelWidget level = LevelWidget("A1 - Beginner",
      "A1 covers the basics of english: verbs, subjects, adverbs, etc.", [
    LessonName(
        "Adverbs of Frequency",
        LessonWidget("Frequency of Adverbs", lessonContentall),
        FontAwesomeIcons.bone),
    LessonName("Adverbousity", LessonWidget("Custom Words II", lessonContent1),
        FontAwesomeIcons.candyCane),
    LessonName("Frequenberbs", LessonWidget("Wordom", lessonContent2),
        FontAwesomeIcons.canadianMapleLeaf),
    LessonName("Lannister Work",LessonWidget("Duty of the Kings", lessonContent3),
        FontAwesomeIcons.bone),
    LessonName("Redbone",LessonWidget("Duty of the Kings", lessonContent4),
        FontAwesomeIcons.bone),
  ]);

  final List<Widget> levels = [
    // LevelName("Beguinner","A1",Color(0xff8a76fa),level),
    // LevelName("Beguinner","A2",Color(0xff18b8da),level),
    // LevelName("Intermediate","B1",Color(0xffbbcd2b),level),
    // LevelName("Intermediate","B2",Color(0xffffd33f),level),
    // LevelName("Advanced","C1",Color(0xfff4973a),level),
    // LevelName("Advanced","C2",Color(0xffe770d4),level),
    LevelName("Beginner", "A1", Color(0xff6ED8EB), level),
    LevelName("Beginner", "A2", Color(0xff67cbdd), level),
    LevelName("Intermediate", "B1", Color(0xff009dbb), level),
    LevelName("Intermediate", "B2", Color(0xff3283E6), level),
    LevelName("Advanced", "C1", Color(0xff245FA6), level),
    LevelName("Advanced", "C2", Color(0xff143359), level),
    LevelName("Beginner", "A1", Color(0xff6ED8EB), level),
    LevelName("Beginner", "A2", Color(0xff67cbdd), level),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.cyan,
          //   actions: <Widget>[
          //     //Setting IconButton action item to send message
          //     IconButton(
          //       icon: Icon(Icons.account_circle),
          //       iconSize: 50,
          //       onPressed: () {},
          //     )
          //   ],
          //   title: Text("GoodStart Learning"),
          //   elevation: 0.0,
          // ),
          body: Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 86.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Wrap(
                    children: levels,
                  ),
                ),
              ),
            ),
            GradientAppBar("Good Learning"),
          ],
        ),
      )
          // ListView.builder(
          //   itemBuilder:(context, index) {
          //     return Wrap(
          //       children: <Widget>[
          //         levels[index],
          //       ],
          //     );
          //   },
          //   itemCount: levels.length,
          // ),
          // //LevelWidget("A1 - Basics","A1 covers the basics of english: verbs, subjects, adverbs, etc.",[Text("Adverbs of Frequency"),Text("Simple Present"),Text("Past Present"),Text("Future Present"),Text("Resumo"),])
          //LessonWidget("Adverbs of Frequency","Knowing Adverbs of Frequency is essencial  to understand the general structure of the english language.",[Text("Why did the chicken cross the road?"),Text("Questions I"),Text("Questions II")]),
          //TextContentWidget("""<h1>This is filler text</h1>Dismiss. All your code in one place. GitHub makes it easy to scale back on context switching. Read rendered documentation, see the history of any file...<br>A text only node is a child of a tag with no inner html.<h1>This is filler text</h1>Dismiss. All your code in one place. GitHub makes it easy to scale back on context switching. Read rendered documentation, see the history of any file...<br>A text only node is a child of a tag with no inner html.<h1>This is filler text</h1>Dismiss. All your code in one place. GitHub makes it easy to scale back on context switching. Read rendered documentation, see the history of any file...<br>A text only node is a child of a tag with no inner html. <h1>This is filler text</h1>Dismiss. All your code in one place. GitHub makes it easy to scale back on context switching. Read rendered documentation, see the history of any file...<br>A text only node is a child of a tag with no inner html.<h1>This is filler text</h1>Dismiss. All your code in one place. GitHub makes it easy to scale back on context switching. Read rendered documentation, see the history of any file...<br>A text only node is a child of a tag with no inner html.""")
          //CheckboxExerciseWidget(3,"Question One","Choose the gramatically correct word",["bye","boy","boi",]),
          ),
    );
  }
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
          Icon(Icons.menu, color: Colors.black.withOpacity(0.7)),
          Center(
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    fontSize: 20.0,
                    color: Colors.black.withOpacity(0.7))),
          ),
          Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFF6F6F6), width: 1)),
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
