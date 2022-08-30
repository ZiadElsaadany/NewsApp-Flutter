import 'package:flutter/material.dart';
import 'package:news/model/news_response/NewsResponse.dart';
import 'package:news/Home/news/news_container_view.dart';
import '../../api_manager.dart';
import '../../model/Sources.dart';
import '../../model/news_response/Articles.dart';

class NewsContainer extends StatefulWidget {
Sources selectedSource;

NewsContainer(this.selectedSource);

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
late ScrollController  scrollContoller ;
bool shouldLoadingNextPage =false;
int page = 1 ;
List<News> newNews = [] ;

@override
  void initState() {  // to initialize controller
    scrollContoller = ScrollController();
    scrollContoller.addListener(() {

      if(scrollContoller.position.atEdge){
        bool isTop = scrollContoller.position.pixels == 0 ;
        if(isTop) {
          print ('At The Top ') ;
        }else{
          shouldLoadingNextPage = true ;
          setState(() {

          });
          print ('At The bottom');
        }
      }

    });
  }
  @override
  Widget build(BuildContext context) {
  if(shouldLoadingNextPage==true)  {
      ApiManager.getNews(sourceId:widget.selectedSource.id,page: ++page).
      then((value) {
        if(value!=null ) {
          setState(() {
            newNews.addAll(value.articles!.toList());
            shouldLoadingNextPage=false;

          });
        }
      }
      );
    }


    return Expanded(
      child: FutureBuilder<NewsResponse>(
          future: ApiManager.getNews(sourceId: widget.selectedSource.id??""),
          builder: (context, snapshot) {

            if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('Try again'))
                ],
              );
            }
            else if(snapshot.hasData){
              if(newNews.isEmpty ) {
                newNews = snapshot.data!.articles ?? [] ;
              }
              if(snapshot.data!.articles?[0].title !=newNews.elementAt(0).title){
                scrollContoller.jumpTo(0);
                newNews=snapshot.data!.articles ?? []  ;
              }
              return ListView.builder(
                controller:scrollContoller,
                itemBuilder: (_,index){
                  return NewsContainerView( newNews[index] );
                },
                itemCount: newNews.length,
              );
            }
            else{
              return  Center(child: CircularProgressIndicator( color: Theme.of(context).primaryColor,));
            }

          }),
    );
  }
}
