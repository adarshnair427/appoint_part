import 'package:flutter/material.dart';

class Back extends StatefulWidget {

  const Back();

  @override
  _BackState createState() => _BackState();
}

class _BackState extends State<Back> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.05,
      width: width*0.05,
      decoration: new BoxDecoration(
        color: Color(0xff24e2b6),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
        iconSize: height*0.016,
        onPressed: () => Navigator.of(context).pop(),),
    );
  }
}
