import 'package:injectable/injectable.dart';

import '../../../api/api_manger.dart';
import '../../../model/NewsResponse.dart';
import 'news_remote_data_source.dart';

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManger apiManger;

  NewsRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    var response = await apiManger.getNewsBySourceId(sourceId);
    return response;
  }
}
