// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manger.dart' as _i339;
import '../repository/news/dataSource/news_remote_data_source.dart' as _i825;
import '../repository/news/dataSource/news_remote_data_source_impl.dart'
    as _i824;
import '../repository/news/repository/news_repository.dart' as _i251;
import '../repository/news/repository/news_repository_impl.dart' as _i941;
import '../repository/source/dataSource/source_offline_data_source.dart'
    as _i1017;
import '../repository/source/dataSource/source_offline_data_source_impl.dart'
    as _i485;
import '../repository/source/dataSource/source_remote_data_source.dart' as _i50;
import '../repository/source/dataSource/source_remote_data_source_impl.dart'
    as _i457;
import '../repository/source/repository/source_repository.dart' as _i1033;
import '../repository/source/repository/source_repository_impl.dart' as _i975;
import '../ui/home/category/cubit/source_view_model.dart' as _i263;
import '../ui/home/news/cubit/news_view_model.dart' as _i320;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i1017.SourceOfflineDataSource>(
        () => _i485.SourceOfflineDataSourceImpl());
    gh.factory<_i825.NewsRemoteDataSource>(
        () => _i824.NewsRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i251.NewsRepository>(() => _i941.NewsRepositoryImpl(
        remoteDataSource: gh<_i825.NewsRemoteDataSource>()));
    gh.factory<_i320.NewsViewModel>(
        () => _i320.NewsViewModel(newsRepository: gh<_i251.NewsRepository>()));
    gh.factory<_i50.SourceRemoteDataSource>(() =>
        _i457.SourceRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i1033.SourceRepository>(() => _i975.SourceRepositoryImpl(
          remoteDataSource: gh<_i50.SourceRemoteDataSource>(),
          offlineDataSource: gh<_i1017.SourceOfflineDataSource>(),
        ));
    gh.factory<_i263.SourceViewModel>(() =>
        _i263.SourceViewModel(sourceRepository: gh<_i1033.SourceRepository>()));
    return this;
  }
}
