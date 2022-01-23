import 'package:rxdart/subjects.dart';

class HomeBloc {
    
  // final _chatListController = BehaviorSubject<List<ChatModel>>();
  final _chatListController = BehaviorSubject<List<dynamic>>();
  get chatListControllerSink => _chatListController.sink.add;
  get chatListControllerStream => _chatListController.stream;


  void dispose(){
    _chatListController.close();
  }
}