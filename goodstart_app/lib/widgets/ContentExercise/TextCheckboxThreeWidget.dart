import 'package:flutter/material.dart';
import 'package:goodstart_app/widgets/Content/TextContentWidget.dart';
import 'package:goodstart_app/widgets/ContentExercise/bloc/TextCheckboxThreeBloc.dart';
import 'package:goodstart_app/widgets/Exercises/CheckboxThreeWidget.dart';

class TextCheckboxThreeWidget extends StatefulWidget {
  final String content; //get from db (dont have a var)
  //final bool isRightAnswer // get from bloc
  //final int id; //get from constructor
  final int answer; //get from db (dont have a var)
  final String title; //get from db (dont have a var)
  final String subtitle; //get from db (dont have a var)
  final List<String> options; //get from db (dont have a var)

  final Widget link;
  final PageController controller;
  final bool isLastChild;

  TextCheckboxThreeWidget(
      this.content, this.answer, this.title, this.subtitle, this.options,
      {this.link, this.controller, this.isLastChild});

  @override
  _TextCheckboxThreeWidgetState createState() => _TextCheckboxThreeWidgetState();
}

class _TextCheckboxThreeWidgetState extends State<TextCheckboxThreeWidget> {
  TextCheckboxThreeBloc bloc;
  @override
  void initState() {
    bloc = new TextCheckboxThreeBloc(widget.answer);
    super.initState();
  }

  @override
  void dispose() {
    bloc.isCorrectValue.close();
    super.dispose();
  }

  Widget get raisedButtonDynamic {
    if (bloc.isGotValueRightOut.value != null) {
      //if there is a selected option or not
      if (bloc.isGotValueRightOut.value) {
        //once you press the button and get it right
        return RaisedButton(
          onPressed: () {
            if (widget.isLastChild == true) {
              Navigator.pop(context);
            } else {
              widget.controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "NEXT",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          color: Colors.green,
        );
      } else {
        //once you press the button and get it wrong
        return RaisedButton(
          onPressed: () {
            if (widget.isLastChild == true) {
              Navigator.pop(context);
            } else {
              widget.controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "NEXT",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          color: Colors.redAccent,
        );
      }
    } else {
      //when you select a option, the button turns green
      return RaisedButton(
        onPressed: () {
          if (bloc.isCorrectValue.value) {
            bloc.isGotValueRightIn.add(true);
          } else {
            bloc.isGotValueRightIn.add(false);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "CHECK",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        color: Colors.lightGreen,
      );
    }
  }

  Widget get nextButton {
    if (bloc.hasSelectedStream.value == true) {
      return Padding(
        padding:
            const EdgeInsets.only(right: 16.0, left: 16, top: 5, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<Object>(
                stream: bloc.isGotValueRightOut,
                builder: (context, snapshot) {
                  return raisedButtonDynamic;
                })
          ],
        ),
      );
    } else {
      return Padding(
        padding:
            const EdgeInsets.only(right: 16.0, left: 16, top: 5, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () => null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "CHECK",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                  ),
                ),
              ),
              splashColor: Colors.white,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CorrectAnswerBloc(
      insertedValueIn: bloc.insertedValueIn,
      hasSelectedSink: bloc.hasSelectedSink,
      child: ListView(
        children: <Widget>[
          TextContentWidget(widget.content),
          //CheckboxExerciseWidget(answer, title, subtitle, options),
          CheckboxThreeWidget(
            options: widget.options,
          ),
          StreamBuilder<Object>(
              stream: bloc.hasSelectedStream,
              builder: (context, snapshot) {
                return nextButton;
              }),
        ],
      ),
    );
  }
}

class CorrectAnswerBloc extends InheritedWidget {
  const CorrectAnswerBloc({
    @required this.insertedValueIn,
    @required this.hasSelectedSink,
    Widget child,
  }) : super(child: child);

  final Sink insertedValueIn;
  final Sink hasSelectedSink;

  static CorrectAnswerBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CorrectAnswerBloc)
        as CorrectAnswerBloc);
  }

  @override
  bool updateShouldNotify(CorrectAnswerBloc old) {
    //return correctValueOut.value != old.correctValueOut.value;}
    return false;
  }
}
