import 'package:flutter/material.dart';
import 'package:news/model/category.dart';

class HeadingContainer extends StatelessWidget {
Function onClicked;
HeadingContainer(this.onClicked, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox
            (height: 20,),
          const Text(
            'Pick your Category \n of interest', style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xff4F5A69)
          ) ,
          textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 ,
                    crossAxisSpacing:  8,
                 mainAxisSpacing: 8
                ),
                itemBuilder: (_,index) {
                  List<Category>  category = Category.getCategories() ;
                  return InkWell(
                         onTap:(){
                           onClicked(category[index]);
                           },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.only(top: 8),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(category[index].colorCode!),
                        borderRadius: index%2==0?const BorderRadius.only(
                          bottomLeft: Radius.circular(50) ,
                          topLeft: Radius.circular(20) ,
                          topRight: Radius.circular(20)  ,
                        )
                        : const BorderRadius.only(
                    bottomRight:  Radius.circular(50),
                    topLeft: Radius.circular(20) ,
                    topRight: Radius.circular(20)  ,
                       ),
                      ),
                      child: Column (
                        children: [
                          Image(image: AssetImage(
                             category[index].img??""),
                           fit:BoxFit.cover,

                          ) ,
                        Text(category[index].title??"",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        )
                        ],
                      ),
                    ),
                  ) ;

                } ,
            itemCount: Category.getCategories().length,

            ),
          )
        ]
      ),
    );
  }
}
