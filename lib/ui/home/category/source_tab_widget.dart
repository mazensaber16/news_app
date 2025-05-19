import 'package:flutter/material.dart';
import 'package:news/ui/home/category/source_name_item.dart';

import '../../../model/SourceResponse.dart';
import '../../../utils/app_colors.dart';
import '../news/news_widget.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: AppColors.transparentColor,
                indicatorColor: Theme.of(context).indicatorColor,
                tabs: widget.sourcesList.map((source) {
                  return SourceNameItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source));
                }).toList()),
            Expanded(
                child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
