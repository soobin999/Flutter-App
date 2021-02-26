import 'dart:math';
import 'dart:typed_data';

import 'package:example/detail/detail.dart';
import 'package:example/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';


class temp extends StatelessWidget {
  final List<SearchResult> results;


void randomList(context){
  var _random=Random().nextInt(results.length);
  print(_random);
  Navigator.push(context,MaterialPageRoute(builder: (context) => detail(resultss:results[_random])));
}
  const temp({Key key, this.results}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              title: Text("맛집 리스트"),
              backgroundColor: Colors.grey,
              expandedHeight: 50,
              flexibleSpace: FlexibleSpaceBar(),
              floating: true,
              snap: true,
              ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return  ListTile(
                  title: Text(results[index].name),
                  subtitle:  Text(results[index].rating==null?0.toString():results[index].rating.toString()),
                  onTap: () => {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => detail(resultss:results[index])))
                  },
                );
              },childCount: results.length
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.search),
        tooltip: 'Random Choice',
        onPressed: ()=>{
          randomList(context)
        },
      ),
    );
  }
}
