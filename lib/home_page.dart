import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("News App"),
      ),
    body: Expanded(
        child:ListView.builder(itemBuilder: (context, index)
        {
          return Card(
            child: ListTile(
              leading: Text("Name"),
              title: Text("Name"),
            ),
          );
        },
        itemCount: 9,
        )),
    );
  }
}
