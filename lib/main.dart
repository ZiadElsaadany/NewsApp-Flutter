
import 'package:flutter/material.dart';
import 'package:news/Home/HomeScreen.dart';
import 'package:news/Home/category/categories_details.dart';
import 'package:news/details/details_screen.dart';
void main(){

  runApp(myApp());
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      routes: {
        HomeScreen.route_name:(_)=>HomeScreen(),
        DetailsScreen.route_name:(_)=>DetailsScreen()
      } ,
      initialRoute: HomeScreen.route_name,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xff39A552),
        appBarTheme: const AppBarTheme(
          color: Color(0xff39A552),
          centerTitle: true
        )
      ),
    );
  }
}