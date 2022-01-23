import 'package:flutter/material.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxThreeWidget.dart';

class CheckboxThreeWidget extends StatefulWidget {
  final List<String> options;

  CheckboxThreeWidget({Key key, this.options}) : super(key: key);

  @override
  createState() {
    return new CheckboxThreeWidgetState();
  }
}

class CheckboxThreeWidgetState extends State<CheckboxThreeWidget> {
  List<RadioModel> _options = new List<RadioModel>();

  void radioListBuilder(List<String> options) {
    for (int i = 0; i < widget.options.length; i++) {
      _options.add(RadioModel(false, i, widget.options[i]));
    }
  }

  @override
  void initState() {
    radioListBuilder(widget.options);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 15,left: 15,top: 20),
          height: 300,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("Hi",style: TextStyle(fontSize: 100,color: Colors.white),),
            ],
          )
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top:20,bottom: 20),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 25,
            children: _options.map((radioModel) {
              return new InkWell(
                //highlightColor: Colors.red,
                splashColor: Colors.blueAccent,
                onTap: () {
                  setState(() {
                    if (!radioModel.isSelected) {
                      //deactivates all other ones (only one can be selected at a time)
                      _options.forEach((element) => element.isSelected = false);
                      //activates the selected one
                      radioModel.isSelected = true;
                      CorrectAnswerBloc.of(context)
                          .insertedValueIn
                          .add(radioModel.buttonNumber);
                      CorrectAnswerBloc.of(context).hasSelectedSink.add(
                          true); //if u clicked on any button, send to the sink that you have selected an option
                    }
                    // else { //if removing a click
                    //   _options.forEach((element) => element.isSelected = false); //remove all
                    //   CorrectAnswerBloc.of(context).correctValueIn.add(-1);
                    // }
                  });
                },
                child: new RadioItem(radioModel),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width / 3 - 25,
      constraints: BoxConstraints(
        minHeight: 50,
      ),
      
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
      child: new Center(
        child: new Text(_item.text, style: TextStyle(fontSize: 18)),
      ),
      decoration: new BoxDecoration(
        color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
        border: new Border.all(
            width: 1.0,
            color: _item.isSelected ? Colors.blueAccent : Colors.grey),
        borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final int buttonNumber;
  final String text;

  RadioModel(this.isSelected, this.buttonNumber, this.text);
}
