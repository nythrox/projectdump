import 'package:rxdart/rxdart.dart';

class TextCheckboxOneBloc {

  int value;
  
  //when you pressed the button, did you get it right or wrong
  final isGotValueRight = new BehaviorSubject<bool>();
  Sink<bool> get isGotValueRightIn => isGotValueRight.sink;
  ValueObservable<bool> get isGotValueRightOut => isGotValueRight.stream; 

  //if the button you selected is the right one
  final isCorrectValue = new BehaviorSubject<bool>.seeded(false);
  Sink<bool> get correctValueIn => isCorrectValue.sink;
  ValueObservable<bool> get correctValueOut => isCorrectValue.stream; 


  //if you have selected a button 
  final hasSelectedSubject = new BehaviorSubject<bool>.seeded(false);
  Sink<bool> get hasSelectedSink => hasSelectedSubject.sink;
  ValueObservable<bool> get hasSelectedStream => hasSelectedSubject.stream; 
  
  //what button you selected
  final insertedValue = new BehaviorSubject<int>.seeded(-1);
  Sink<int> get insertedValueIn => insertedValue.sink;
  ValueObservable<int> get insertedValueOut => insertedValue.stream; 

  TextCheckboxOneBloc(this.value){
    insertedValueOut.listen((data){
      if (data == value) {
        correctValueIn.add(true);
      }
      else {
        correctValueIn.add(false);
      }
    });
  }

  void dispose(){
    isCorrectValue.close();
    insertedValue.close();
    hasSelectedSubject.close();
    isGotValueRight.close();
  }
  
   
}