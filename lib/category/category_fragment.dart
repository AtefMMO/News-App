import 'package:flutter/material.dart';
import 'package:news_project/category/category.dart';
import 'package:news_project/category/category_item.dart';

import 'category_details.dart';

class CategoryFragment extends StatelessWidget {

 var categories=Categories.getCategories();
 Function onCategoryClick;
 CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Pick your category of interest',style: TextStyle(fontSize: 20),),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(itemBuilder:(context, index) {return InkWell(onTap: (){onCategoryClick( categories[index]);},child: CategoryItem(categories: categories[index], index: index));}
            ,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10) ,
            itemCount: categories.length,
          ),
        ),
      )
    ],);
  }
}
