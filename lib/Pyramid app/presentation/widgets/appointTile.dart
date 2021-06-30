import 'package:appoint_part/Data/appointmentInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//Appointment List specification container
class Appointment extends StatelessWidget {
  final AppointmentInfo appointment;

  const Appointment({this.appointment});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        height:height*0.08,
        decoration: BoxDecoration(
            border:Border.all(color: Color(0xffafb7c2)),
            borderRadius: BorderRadius.all(Radius.circular(7))
        ),
        child: Padding(
          padding: EdgeInsets.only(left:width*0.02,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(appointment.patient.name,
                    style: TextStyle(
                      color: Color(0xffafb7c2),
                      fontSize: height*0.015,
                      fontFamily: "Mont",
                      fontWeight: FontWeight.w500,
                    ),),
                  Padding(
                    padding: EdgeInsets.only(left:width*0.02,right:width*0.02,),
                    child: Icon(
                      Icons.circle,
                      color: Color(0xffafb7c2),
                      size:5,
                    ),
                  ),
                  Text('Rs 300 due',
                    style: TextStyle(
                      color: Color(0xffafb7c2),
                      fontSize: height*0.015,
                      fontFamily: "Mont",
                      fontWeight: FontWeight.w500,
                    ),),
                ],
              ),
              Row(
                children: [
                  Text(DateFormat.Hm().format(appointment.dateTime),
                    style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: height*0.02,
                      fontFamily: "Sofia Pro",
                      fontWeight: FontWeight.w700,
                    ),),
                  Padding(
                    padding: EdgeInsets.only(left:width*0.02,right:width*0.02,),
                    child: Text('|',
                      style: TextStyle(
                        color: Color(0xffafb7c2),
                        fontSize: height*0.025,
                        fontFamily: "Mont",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(appointment.disease,
                    style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: height*0.02,
                      fontFamily: "Sofia Pro",
                    ),),
                ],
              ),
            ],
          ),
        )
    );
  }
}