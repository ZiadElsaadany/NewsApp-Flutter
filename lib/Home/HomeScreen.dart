import 'package:flutter/material.dart';
import 'package:news/Home/home_drawer.dart';
import '../api_manager.dart';
import '../model/category.dart';
import '../model/news_response/NewsResponse.dart';
import 'HeadingContainer.dart';
import 'category/categories_details.dart';
import 'news/news_container_view.dart';

class HomeScreen extends StatefulWidget {
static const String route_name = 'HomeScreen';
bool  d= false ;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
         const    Text('News',style: TextStyle(
              fontSize: 30

            ),),

          IconButton(
           icon: const Icon (  Icons.search) ,
           onPressed:  ( ){
              showSearch(context: context, delegate: NewsSearch() ) ;
           },)
          ],
        ),
      ),
     drawer: Drawer(
        child: HomeDrawer( onSideMenuItemCick),
     ),
      body:
      widget.d == false &&selectedCategory==null?
      HeadingContainer(onCategoryClicked)
          :
      Categories(selectedCategory?? Category(colorCode: 1 ,title: '',img: '',id: ''))


    );
  }
   Category  ?   selectedCategory=null;
   void onCategoryClicked(Category category){
     setState(() {
       selectedCategory == category ;
       widget.d=true ;
    });
  }

  void onSideMenuItemCick(int clickedItem){
     Navigator.pop(context);
        if(clickedItem==HomeDrawer.CATEGORIES){
          widget.d = false;
          selectedCategory=null;
          setState(() {
          });
        }else if(clickedItem==HomeDrawer.SETTINGS)  {

        }
  }


}
class NewsSearch extends SearchDelegate {
  @override
  List<Widget> ? buildActions(BuildContext context) {
    // in end  appBar
         return  [
           IconButton(icon:Icon( Icons.search),
             onPressed: ( ) {  showResults(context); } ,color: Colors.black,)
         ] ;

  }

  @override
  Widget? buildLeading(BuildContext context) {
   // in start appBar
    return IconButton(onPressed: (){
        Navigator.pop(context);
    }, icon: Icon(Icons.clear), color: Colors.black,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(searchKeyWord: query),
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
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          //i got data from server
          var newList = snapshot.data?.articles?? [];
          return ListView.builder(itemBuilder: (_,index){
            return NewsContainerView( newList[index] );
          },
            itemCount: newList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(searchKeyWord: query),
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
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          //i got data from server
          var newList = snapshot.data?.articles?? [];
          return ListView.builder(itemBuilder: (_,index){
            return NewsContainerView( newList[index] );
          },
            itemCount: newList.length,
          );
        });
  }

}
