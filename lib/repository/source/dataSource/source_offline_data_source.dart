//todo: local => offline

import '../../../model/SourceResponse.dart';

abstract class SourceOfflineDataSource {
  Future<SourceResponse?> getSources(String categoryId);

  void saveSources(SourceResponse? sourceResponse, String categoryId);
}
