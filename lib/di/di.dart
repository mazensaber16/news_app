// //todo: viewModel => object Repository
// // todo: Repository => object DataSource
// // todo: DataSource => object ApiManger
//
// import 'package:news_sun3_c13/api/api_manger.dart';
// import 'package:news_sun3_c13/repository/news/dataSource/news_remote_data_source.dart';
// import 'package:news_sun3_c13/repository/news/dataSource/news_remote_data_source_impl.dart';
// import 'package:news_sun3_c13/repository/news/repository/news_repository.dart';
// import 'package:news_sun3_c13/repository/news/repository/news_repository_impl.dart';
// import 'package:news_sun3_c13/repository/source/dataSource/source_offline_data_source.dart';
// import 'package:news_sun3_c13/repository/source/dataSource/source_offline_data_source_impl.dart';
// import 'package:news_sun3_c13/repository/source/dataSource/source_remote_data_source.dart';
// import 'package:news_sun3_c13/repository/source/dataSource/source_remote_data_source_impl.dart';
// import 'package:news_sun3_c13/repository/source/repository/source_repository.dart';
// import 'package:news_sun3_c13/repository/source/repository/source_repository_impl.dart';
//
// SourceRepository injectSourceRepository() {
//   return SourceRepositoryImpl(
//       remoteDataSource: injectSourceRemoteDataSource(),
//       offlineDataSource: injectSourceOfflineDataSource());
// }
//
// SourceRemoteDataSource injectSourceRemoteDataSource() {
//   return SourceRemoteDataSourceImpl(apiManger: ApiManger.getInstance());
// }
//
// SourceOfflineDataSource injectSourceOfflineDataSource() {
//   return SourceOfflineDataSourceImpl();
// }
//
//
//
// NewsRepository injectNewsRepository() {
//   return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
// }
//
// NewsRemoteDataSource injectNewsRemoteDataSource() {
//   return NewsRemoteDataSourceImpl(apiManger: ApiManger.getInstance());
// }
