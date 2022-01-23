import 'package:flutter/material.dart';
import 'package:goodstart_app/widgets/ContentExercise/TextCheckboxOneWidget.dart';

class CheckboxOneWidget extends StatefulWidget {
  final List<String> options;

  CheckboxOneWidget({Key key, this.options}): super(key: key);


  @override
  createState() {
    return new CheckboxOneWidgetState();
  }
}

class CheckboxOneWidgetState extends State<CheckboxOneWidget> {

  final List<RadioModel> _options = new List<RadioModel>();

  void radioListBuilder(List<String> options){
    for (int i = 0; i < widget.options.length; i++){
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
      children:_options.map((radioModel){
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: new InkWell(
                //highlightColor: Colors.red,
                splashColor: Colors.blueAccent,
                onTap: () {
                  setState(() {
                    if (!radioModel.isSelected) {
                      //deactivates all other ones (only one can be selected at a time)
                      _options.forEach((element) => element.isSelected = false);
                      //activates the selected one
                      radioModel.isSelected = true;
                      CorrectAnswerBloc.of(context).insertedValueIn.add(radioModel.buttonNumber);
                      CorrectAnswerBloc.of(context).hasSelectedSink.add(true); //if u clicked on any button, send to the sink that you have selected an option
                    }
                    // else { //if removing a click
                    //   _options.forEach((element) => element.isSelected = false); //remove all
                    //   CorrectAnswerBloc.of(context).correctValueIn.add(-1);
                    // }
                  });
                },
                child: new RadioItem(radioModel),
              ),
        );
      }).toList(),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: new Text(_item.text,
          style: new TextStyle(
              color:
                  _item.isSelected ? Colors.white : Colors.black,
              //fontWeight: FontWeight.bold,
              fontSize: 23.0)),
      decoration: new BoxDecoration(
        color: _item.isSelected
            ? Colors.blueAccent
            : Colors.transparent,
        border: new Border.all(
            width: 1.0,
            color: _item.isSelected
                ? Colors.blueAccent
                : Colors.grey),
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