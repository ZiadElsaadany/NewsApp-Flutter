import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/model/SourcesResponces.dart';
import 'package:news/Home/category/tab_container.dart';
import 'package:news/model/category.dart';


class Categories extends StatelessWidget {
  static const String route_name = 'Categories';

   Category  category;
   Categories(this.category);
     @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: FutureBuilder<SourcesResponces>(
                future: ApiManager.getSources(
                    category.id!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  Center(child: CircularProgressIndicator( color: Theme.of(context).primaryColor,));
                  }
                  else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Something went wrong'),
                        ElevatedButton(onPressed: () {}, child: Text('Try again'))
                      ],
                    );
                  }
                  if (snapshot.data?.status != 'ok') {
                    //server response has code and message
                    return Column(
                      children: [
                        Text('${snapshot.data?.message}'),
                        ElevatedButton(onPressed: () {},
                            child: Text('Try again'))
                      ],
                    );
                  }
                         //i got data from server
                  var sourcesList =
                      snapshot.data?.sources ?? []; // if null equal = []
                  return TabContainer(sourcesList);
                }),
          )
        ],

    );
  }
}
