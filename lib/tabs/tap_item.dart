import 'package:flutter/material.dart';

import '../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem({required this.isSelected, required this.source});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color:  Colors.green , width: 2),
        color: isSelected?Colors.green:Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            source.name ?? '',
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.green, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
