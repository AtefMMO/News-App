import 'package:flutter/material.dart';

import 'package:news_project/news/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../api_manager.dart';
import '../model/NewsResponse.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'SearchScreen';
  String query = 'News';
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            AppLocalizations.of(context)!.search_news,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
              onChanged: (value) {
                widget.query = value;
                setState(() {});
              },
            ),
          ),
          FutureBuilder<NewsResponse>(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(AppLocalizations.of(context)!.error),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsByQuery(widget.query ?? '');
                            setState(() {});
                          },
                          child: Text(AppLocalizations.of(context)!.try_again))
                    ],
                  );
                } else if (snapshot.data?.status != 'ok') {
                  return Column(
                    children: [
                      Text(snapshot.data?.message ?? 'Error'),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsByQuery(widget.query ?? '');
                            setState(() {});
                          },
                          child: Text(AppLocalizations.of(context)!.try_again))
                    ],
                  );
                }
                var newsList = snapshot.data?.articles ?? [];

                return Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) =>
                      NewsItem(news: newsList[index]),
                  itemCount: newsList.length,
                ));
              },
              future: ApiManager.getNewsByQuery(widget.query!))
        ]));
  }
}
