import 'package:injectable/injectable.dart';
import 'package:news/repository/source/dataSource/source_remote_data_source.dart';

import '../../../api/api_manger.dart';
import '../../../model/SourceResponse.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManger apiManger;

  SourceRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManger.getSources(categoryId);
    return response;
  }
}
