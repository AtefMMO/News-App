import 'package:flutter/material.dart';
import 'package:news_project/api_manager.dart';
import 'package:news_project/category/category.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/news/news_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_project/tabs/tab_container.dart';

class CategoryDetails extends StatefulWidget {
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
  Categories categories;
  CategoryDetails({required this.categories});
}

class _CategoryDetailsState extends State<CategoryDetails> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
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
                Text(''),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSource(widget.categories.id!);
                      setState(() {});
                    },
                    child: Text(AppLocalizations.of(context)!.error))
              ],
            );
          } else if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? 'Error'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSource(widget.categories.id!);
                      setState(() {});
                    },
                    child: Text(AppLocalizations.of(context)!.try_again))
              ],
            );
          }
          var sourceList = snapshot.data?.sources ?? [];

          return TabContainer(sourceList: sourceList);
        },
        future: ApiManager.getSource(widget.categories.id!));
  }
}
