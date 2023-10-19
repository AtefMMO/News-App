import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_project/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
Articles news;
NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
ClipRRect(
  child:
      CachedNetworkImage(
      imageUrl: news.urlToImage??'',
        placeholder: (context, url) => Center(child: CircularProgressIndicator(color:  Colors.green,)),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
  borderRadius: BorderRadius.circular(20),
),
  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(news.author??'',textAlign: TextAlign.start,),
  ),
  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(news.title??''),
  ),
  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(news.publishedAt??'',textAlign: TextAlign.end,),
  )
],
      ),
    );
  }
}
