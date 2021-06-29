import 'package:appoint_part/presentation/widgets/backButton.dart';
import 'package:flutter/material.dart';

class AddAppointment extends StatefulWidget {
  AddAppointment({@required this.title});

  final String title;

  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {




  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Back(),
        title:Text('Add Appointment',
          style: TextStyle(
            color: Color(0xff1a1a1a),
            fontSize: height*0.025,
            fontFamily: "Mont",
            fontWeight: FontWeight.w700,
          ),),
        elevation:1,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:width*0.08, right:width*0.08, top:height*0.03,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children:[Text('Title',
                    style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: height*0.022,
                      fontFamily: "Mont",
                    ),),
                    Padding(
                      padding: EdgeInsets.only(top:height*0.015,),
                      child: TextField(
                        maxLines:1,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Gastrointestinal Disease",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:height*0.03,),
                      child: Text('About',
                        style: TextStyle(
                          color: Color(0xff1a1a1a),
                          fontSize: height*0.022,
                          fontFamily: "Mont",
                        ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:height*0.015,),
                      child: TextField(
                        maxLines:10,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean accumsan nisl ac felis tincidunt consequat.Etiam a sem et odio commodoidos.",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ),
                    Container(
                            width: double.infinity,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              gradient: new LinearGradient(
                                colors: [Color(0xff24e2b6), Color(0xff2BA7D5)],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight,
                              ),
                            ),
                            child: MaterialButton(
                              child: new Text('Save Appointment',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height*0.02,
                                  fontFamily: "Mont",
                                ),),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  '/appointList',
                                );
                              },
                            ),
                          ),
                  ]
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}