import 'package:flutter/material.dart';
import 'package:news_project/api_manager.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/news/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// last time was working here
class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({required this.source});
  String query = '';
  var newsList;
  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) async {
              widget.query = value;
              setState(() {});
            },
            decoration: InputDecoration(
              labelText:  AppLocalizations.of(context)!.search_news,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<NewsResponse>(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.green));
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(AppLocalizations.of(context)!.error),
                    ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
                        setState(() {});
                      },
                      child: Text(AppLocalizations.of(context)!.try_again),
                    )
                  ],
                );
              } else if (snapshot.data?.status != 'ok') {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? 'Error'),
                    ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
                        setState(() {});
                      },
                      child: Text(AppLocalizations.of(context)!.try_again),
                    )
                  ],
                );
              }
              if (widget.query!.isEmpty) {
                widget.newsList = snapshot.data?.articles ?? [];
              } else {
                // Filter articles based on the query content and title
                widget.newsList =
                    (snapshot.data?.articles ?? []).where((article) {
                  return (article.content
                              ?.toLowerCase()
                              .contains(widget.query!.toLowerCase()) ??
                          false) &&
                      (article.title
                              ?.toLowerCase()
                              .contains(widget.query!.toLowerCase()) ??
                          false);
                }).toList();
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: widget.newsList[index]);
                },
                itemCount: widget.newsList.length,
              );
            },
            future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
          ),
        ),
      ],
    );
  }
}
