import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  static const int SETTINGS= 1;
  static const int CATEGORIES= 1;
Function onSideMenuItemClick ;
HomeDrawer(this.onSideMenuItemClick) ;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            width: double.infinity ,
            height: 130 ,
            child: const Text('News App!',
            style: TextStyle(
              color: Colors.white ,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          InkWell(
            onTap: (){
              onSideMenuItemClick(CATEGORIES);
            },
            child: Row(
              children: const [
                SizedBox(width: 10,),
                Icon(
                  Icons.category_outlined, color: Color(0xff303030),),
                SizedBox(width: 20,),
                Text ( 'Categories'  ,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900
                ),
                )
              ],

            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: ( ){
              onSideMenuItemClick(SETTINGS) ;
            },
            child: Row(
              children: const [
                SizedBox(width: 10,),
                Icon(
                  Icons.settings, color: Color(0xff303030),),
                SizedBox(width: 20,),
                Text ( 'Settings'  ,

                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],

            ),
          ),
        ],
      );
  }
}
