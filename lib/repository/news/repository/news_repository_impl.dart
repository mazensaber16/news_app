import 'package:injectable/injectable.dart';

import '../../../model/NewsResponse.dart';
import '../dataSource/news_remote_data_source.dart';
import 'news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource}); // constructor inject
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}
