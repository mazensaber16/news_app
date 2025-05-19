import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di_inject.dart';
import '../../../model/SourceResponse.dart';
import '../../../utils/app_colors.dart';
import 'cubit/news_states.dart';
import 'cubit/news_view_model.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = getIt<NewsViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (state is NewsErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNewsBySourceId(widget.source.id ?? "");
                      },
                      child: Text(
                        'Try Again',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge,
                      ))
                ],
              ),
            );
          } else if (state is NewsSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList[index]);
            },
            itemCount: state.newsList.length,
          );
          }
          return Container();
        });

  }
}
