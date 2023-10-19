import 'dart:ui';

import 'package:flutter/material.dart';

class Categories {
  String? id;
  String? imgPath;
  String? title;
  Color? color;
  Categories(
      {required this.title,
      required this.id,
      required this.color,
      required this.imgPath});
  static List<Categories> getCategories(){
    //business entertainment general health science sports technology
    return [
      Categories(color: Colors.red,title:'business' ,id:'business' ,imgPath:'assets/images/bussines.png' ),
      Categories(color: Colors.blue,title:'entertainment' ,id:'entertainment' ,imgPath:'assets/images/environment.png' ),
      Categories(color: Colors.tealAccent,title:'general' ,id:'general' ,imgPath:'assets/images/environment.png' ),
      Categories(color: Colors.green,title:'health' ,id:'health' ,imgPath:'assets/images/health.png' ),
      Categories(color: Colors.purple,title:'science' ,id:'science' ,imgPath:'assets/images/science.png' ),
      Categories(color: Colors.yellow,title:'sports' ,id:'sports' ,imgPath:'assets/images/ball.png' ),
      Categories(color: Colors.orange,title:'technology' ,id:'technology' ,imgPath:'assets/images/Politics.png' ),
  ];
}
}
