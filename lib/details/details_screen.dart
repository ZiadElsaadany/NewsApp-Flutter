
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news_response/Articles.dart';
class DetailsScreen extends StatelessWidget {

static const String  route_name = 'details' ;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(

appBar: AppBar(
  title: const Text('News Title!'),
),
      body: Container(
        padding: EdgeInsets.all(10 ),

        child:SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(image: NetworkImage(args.urlToImage??'')),
              const SizedBox( height: 10),
              Text(args.author??'' ,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox( height: 10),

              Text(
                args.description??'',  style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.start,),
              const SizedBox( height: 10),

              Text(
                args.publishedAt??'', style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
                textAlign: TextAlign.end,),
              const SizedBox( height: 30),

              Text(
                args.content??'', style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20
              ),

                textAlign: TextAlign.start,
              ),
              const SizedBox( height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 InkWell(
                  onTap: ( ){
      final url = '${args.url}';
      launchURL(url) ;
      },
                   child: const Text('View Full Article', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),),
                 ),

                  IconButton(
                    onPressed:() {
                     final url = '${args.url}';
                            launchURL(url) ;
                    }

                    , icon: Icon (Icons.play_arrow) ,
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  launchURL(String url)async {
    if(await canLaunch(url)){
    await launch(
    forceSafariVC: false,
    forceWebView: true,
    enableJavaScript: true ,
    url
    );
    }
  }

}
