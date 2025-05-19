import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';

import '../../../di/di_inject.dart';
import '../../../model/category_model.dart';
import '../../../utils/app_colors.dart';
import 'cubit/source_states.dart';
import 'cubit/source_view_model.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category-details';
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = getIt<SourceViewModel>(); // field injection

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (state is SourceErrorState) {
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
                        viewModel.getSources(widget.category.id);
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
          } else if (state is SourceSuccessState) {
            return SourceTabWidget(sourcesList: state.sourcesList);
          }
          return Container(); // unreachable
        });

  }
}
