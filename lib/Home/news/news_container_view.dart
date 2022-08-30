import 'package:flutter/material.dart';
import 'package:news/details/details_screen.dart';

import '../../model/news_response/Articles.dart';


class NewsContainerView extends StatelessWidget {
 News news;
 NewsContainerView(this.news) ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(
            DetailsScreen.route_name ,
             arguments:news
        );
      },
      child: Container(
          clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)
        ),
       margin: EdgeInsets.symmetric(horizontal: 10),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [
          news.urlToImage == null? const Icon(Icons.broken_image):
          Image(image: NetworkImage('${news.urlToImage}') ,
          height: 230,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(news.author??"",
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xff79828B),
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Text('${news.description}', maxLines: 1, overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff42505C),
              fontWeight: FontWeight.w500,
               letterSpacing: 1
            ),
          ),
          Text('${news.publishedAt}', textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 12,
                color: Color(0xff79828B),
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
      ),
    );
  }
}

