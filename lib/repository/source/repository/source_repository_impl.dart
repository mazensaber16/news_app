import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/repository/source/repository/source_repository.dart';

import '../../../model/SourceResponse.dart';
import '../dataSource/source_offline_data_source.dart';
import '../dataSource/source_remote_data_source.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;

  SourceOfflineDataSource offlineDataSource;

  SourceRepositoryImpl(
      {required this.remoteDataSource, required this.offlineDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //todo: internet => remote
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      //todo: save sources
      offlineDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    } else {
      //todo: no internet => offline
      var sourceResponse = await offlineDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}
