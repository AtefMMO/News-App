import 'package:flutter/material.dart';
import 'package:news_project/category/category.dart';

class CategoryItem extends StatelessWidget {
  Categories categories;
  int index;
  CategoryItem({required this.categories, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categories.color,
          borderRadius: BorderRadius.only(
            bottomRight:
                index % 2 == 0 ? Radius.circular(0) : Radius.circular(20),
            bottomLeft:
                index % 2 == 0 ? Radius.circular(20) : Radius.circular(0),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          Image.asset(categories.imgPath!,height: MediaQuery.of(context).size.height*0.17,),
          Text(
            categories.title!,
            style: TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
    );
  }
}
