import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/category/category.dart';

import 'category_details.dart';

class MainNews extends StatelessWidget {
Categories categories;
MainNews({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          height: double.infinity,
          width: double.infinity,
        ),
        Image.asset('assets/images/background.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),
        CategoryDetails(categories:categories ,),
        //CategoryFragment()
      ],
    ) ;
  }
}
