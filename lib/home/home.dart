import 'package:example/drawer/drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myList = List();

  @override
  Widget build(BuildContext context) {
    var totalList = ['Item', 'Item1', 'Item2', 'Item3', 'Item4','Item1354','Item1352','Item134','Item14',
      'Item1354s','Item13542', 'Item1', 'Item2', 'Item3', 'Item4','Item1354','Item1352','Item134','Item14','Item1354s','Item13542'];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              title: Text("Cafe 즐겨찾기"),
              backgroundColor: Colors.grey,
              expandedHeight: 50,
              flexibleSpace: FlexibleSpaceBar(),
              floating: true,
              snap: true,
              actions: <Widget>[
                myList.length >totalList.length~/2
                    ? IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        myList = [];
                      });
                    })
                    : IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        myList=totalList;
                      });
                    })
              ]),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(totalList[index]),
                  subtitle: Text('안녕하십니까?'),
                  trailing: myList.contains(totalList[index])
                      ? IconButton(
                          icon: Icon(Icons.star),
                          onPressed: () {
                            setState(() {
                              myList.remove(totalList[index]);
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.star_border),
                          onPressed: () {
                            setState(() {
                              myList.add(totalList[index]);
                            });
                          }),
                );
              },
              childCount:totalList.length,
            ),
          ),
        ],
      ),
      drawer: drawer(context),
    );
  }
}
