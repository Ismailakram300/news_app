import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final String imgUrl;
  final String details;
  final String date;
  final String title;
  final String content;
  const NewsDetails({
    required this.imgUrl,
    required this.details,
    required this.date,
    required this.content,
    required this.title,


});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image(image:NetworkImage(imgUrl)),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: TextStyle(fontSize: 29,fontWeight:FontWeight.bold),),
          ),
          SizedBox(height: 16,),

          //Text(date),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(content ,style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(details ,style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("Publish date: ",       style:      TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
              ],
            ),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("Visit Site ",       style:      TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
              ],
            ),
          ),



        ],
      ),
    );
  }
}
