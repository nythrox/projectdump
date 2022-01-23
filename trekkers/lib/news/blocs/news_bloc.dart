import 'package:trekkers/news/models/news.dart';
import 'package:trekkers/news/repositories/new_repository.dart';

abstract class INewsBloc{
   Future<List<News>> get news;
}



class NewsBloc implements INewsBloc {
  final INewsRepository _newsRepository;
  Future<List<News>> news;

  NewsBloc(this._newsRepository) {
    news = _newsRepository.findAll().then((e) => e.news);
  }
}
