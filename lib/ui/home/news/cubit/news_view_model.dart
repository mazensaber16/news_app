import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../repository/news/repository/news_repository.dart';
import 'news_states.dart';

@injectable
class NewsViewModel extends Cubit<NewsStates> {
  NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  //todo: hold data - handle logic
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(MessageState());
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
