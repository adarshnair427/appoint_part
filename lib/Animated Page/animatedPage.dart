import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _width=50;
  double _height=50;
  Widget _animatedWidget=SearchIcon();

  void _updateState(){
    setState((){
      _width=250;
      _height=50;
      _animatedWidget=SearchBox(width1:35,height1:35);
      Timer(Duration(milliseconds: 200), () {
        _animatedWidget=SearchBox(width1:230,height1:35);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Search',
      home: Scaffold(
        appBar: AppBar(
          title:Text('Animated Search'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  _updateState();
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.ease,
                  height:_height,
                  width:_width,
                  decoration: BoxDecoration(
                    color: Color(0xfff3a63e),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _animatedWidget,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SearchBox extends StatelessWidget {
  final double width1;
  final double height1;
  const SearchBox({@required this.width1, @required this.height1});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
      height:height1,
      width:width1,
      decoration: BoxDecoration(
          color: Color(0xfff3a63e),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(color: Colors.black)
      ),
    );
  }
}

class SearchIcon extends StatelessWidget {

  const SearchIcon();
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
    );
  }
}