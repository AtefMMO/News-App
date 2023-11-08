import 'package:flutter/material.dart';
import 'package:news_project/news/news_container.dart';
import 'package:news_project/tabs/tap_item.dart';

import '../model/SourceResponse.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourceList;
  TabContainer({required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sourceList
                  .map((source) => TabItem(
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                      source: source))
                  .toList(),
            ),
            Expanded(
                child: NewsContainer(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
