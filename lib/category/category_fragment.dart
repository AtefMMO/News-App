import 'package:flutter/material.dart';
import 'package:news_project/category/category.dart';
import 'package:news_project/category/category_item.dart';
import 'package:news_project/home/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            Text(AppLocalizations.of(context)!.search_for_news,style: TextStyle(fontSize: 20),),
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
        Text(AppLocalizations.of(context)!.or,style: TextStyle(fontSize: 20),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.pick_your_category_of_interest,
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
