import 'package:flutter/material.dart';
import 'package:news_project/category/category.dart';
import 'package:news_project/category/category_item.dart';
import 'package:news_project/home/search_screen.dart';

import 'category_details.dart';

class CategoryFragment extends StatefulWidget {
  Function onCategoryClick;

  CategoryFragment({required this.onCategoryClick});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  var categories = Categories.getCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search For News...',style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Icon(Icons.search,color: Colors.blue,size: 30,),
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
              ),
            ),
          ],
        ),
        Text('OR',style: TextStyle(fontSize: 20),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Pick your category of interest',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      widget.onCategoryClick(categories[index]);
                    },
                    child: CategoryItem(
                        categories: categories[index], index: index));
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: categories.length,
            ),
          ),
        )
      ],
    );
  }
}
