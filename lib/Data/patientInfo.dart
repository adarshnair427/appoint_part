import 'package:flutter/cupertino.dart';

class PatientInfo{
  String name;
  String due;
  String time;
  String title;

  PatientInfo({
    @required this.name,
    @required this.due,
    @required this.time,
    @required this.title,
  });
}

List<PatientInfo> patientInfo=[
  PatientInfo(
    name:"Adarsh",
    due:"444",
    time:"1:00pm",
    title:"gas",
  ),
  PatientInfo(
    name:"Adarsh",
    due:"69",
    time:"3:00pm",
    title:"ache",
  ),
];