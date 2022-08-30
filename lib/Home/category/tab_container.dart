import 'package:flutter/material.dart';
import 'package:news/Home/news/news_container.dart';
import 'package:news/Home/category/tab_item.dart';

import '../../model/Sources.dart';

class TabContainer extends StatefulWidget {
List<Sources> sources;
TabContainer(this.sources) ;

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
int index = 0  ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length ,
        child:
        Column (
          children: [
            TabBar(
              tabs: widget.sources.map((sources) => TabItem(
                sources, index==widget.sources.indexOf(sources)
            )).toList(),
            isScrollable: true,
             onTap: (index)
             {
                     this.index= index;
                     setState(() {});
             },
              indicatorColor: Color(0xff39A552),
            ),
            NewsContainer(widget.sources[index])
          ],
        )


    );
  }
}
