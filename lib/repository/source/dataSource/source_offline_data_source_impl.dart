import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news/repository/source/dataSource/source_offline_data_source.dart';

import '../../../model/SourceResponse.dart';

@Injectable(as: SourceOfflineDataSource)
class SourceOfflineDataSourceImpl implements SourceOfflineDataSource {
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    // TODO: read
    var box = await Hive.openBox('SourceTabs');
    var sourceTab = box.get(categoryId);
    return sourceTab;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String categoryId) async {
    // TODO: write
    var box = await Hive.openBox('SourceTabs');
    await box.put(categoryId, sourceResponse); // map
    await box.close();
  }
}
