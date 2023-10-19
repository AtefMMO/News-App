import 'package:flutter/material.dart';
import 'package:news_project/api_manager.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/news/news_container.dart';

import 'package:news_project/tabs/tab_container.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<SourceResponse>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
             return Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CircularProgressIndicator(
                    color: Colors.green,
                  ),
               ],
             );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Error'),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSource();
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
                        ApiManager.getSource();
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
              );
            }
            var sourceList = snapshot.data?.sources ?? [];
            return TabContainer(sourceList: sourceList);
          },
          future: ApiManager.getSource()),
    );
  }
}
