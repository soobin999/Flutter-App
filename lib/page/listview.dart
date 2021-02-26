import 'package:example/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_place/src/search/search_result.dart';

class listView extends StatefulWidget {
  final List<SearchResult> results;

  const listView({Key key, this.results}) : super(key: key);



  @override
  _listViewState createState() => _listViewState(results);

}


class _listViewState extends State<listView> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  _listViewState(List<SearchResult> results);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCubic,
    ).drive(Tween(begin: 0, end: 2));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Object results;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafe 즐겨찾기"),
        backgroundColor: Colors.grey,
        flexibleSpace: FlexibleSpaceBar(),
      ),
      body: GestureDetector(
        onTap: () {
          controller
            ..reset()
            ..forward();
        },
        child: RotationTransition(
          turns: animation,
          child: Stack(
            children: [
              Positioned.fill(
                child: FlutterLogo(),
              ),
              Center(
                child: Text(
                  'Click me!',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  FloatingActionButton(onPressed: () => {print(
                      results)})
                ],
              )
            ],
          ),
        ),
      ),
      drawer: drawer(context),
    );
  }
}
