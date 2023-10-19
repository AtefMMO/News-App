import 'package:flutter/material.dart';
import 'package:news_project/api_manager.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/model/SourceResponse.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.green,));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Error'),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    setState(() {

                    });
                  },
                  child: Text('Try Again'))
            ],
          );
        } else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? 'Error'),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    setState(() {

                    });
                  },
                  child: Text('Try Again'))
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) => Text(newsList[index]?.title?? '',style: TextStyle(color: Colors.black),),
          itemCount: newsList.length,
        );
      },
      future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    );
  }
}
