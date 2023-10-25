import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'NewsDetailsScreen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as NewsDetailsArgs;
    final url = Uri.parse(args.articles.url!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(args.articles.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: args.articles.urlToImage ?? '',
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                    )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  args.articles.author ?? 'Author',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  args.articles.content ?? 'Content',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  args.articles.publishedAt ?? 'Date',
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Text(
                    'For full article click here...',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  onTap: () async {
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsDetailsArgs {
  Articles articles;

  NewsDetailsArgs({required this.articles});
}
