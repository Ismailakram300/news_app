import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/news_details.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var data;
  Future<void> getNewsApi() async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=35f71b31115e481db30a931447a2bb22',
      ),
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      print(data['articles'].length);

    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getNewsApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState==ConnectionState.waiting) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                     itemCount: data['articles'].length,
                      itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetails(
  imgUrl: data['articles'][index]['urlToImage'].toString(),
  title: data['articles'][index]['title'].toString(),
  date: data['articles'][index]['publishedAt'].toString(),
  details: data['articles'][index]['description'].toString(),
  content: data['articles'][index]['content'].toString(),

)),);
                      },
                      child: Card(
                        elevation: 6,
                          color: Colors.grey.shade50,
                        child: Row(
                          children: [
                      
                            Expanded(
                              child: Column(
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(),
                                      child: FittedBox(
                                        child: Image(image: NetworkImage(data['articles'][index]['urlToImage'].toString())),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child:   Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                      
                                Text(data['articles'][index]['title'].toString(),style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                                Text(data['articles'][index]['description'].toString()),
                                Text('')
                              ],
                            ),)
                          ],
                        ),
                      ),
                    );
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
