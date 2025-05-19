
import '../../../../model/NewsResponse.dart';

abstract class NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsErrorState extends NewsStates {
  String errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsStates {
  List<News> newsList;

  NewsSuccessState({required this.newsList});
}

class MessageState extends NewsStates {}