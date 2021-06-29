import 'package:appoint_part/presentation/widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  Calendar({@required this.title});

  final String title;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  final hourController = TextEditingController();
  final minController = TextEditingController();
  bool time=true; // true=> AM, false=>PM

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Back(),
        title:Text('Choose Date and Time',
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
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          availableCalendarFormats: {
            CalendarFormat.month: 'Month',
          },
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            weekendTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            todayBuilder: (context,date,_){
              return Center(
                child: Container(
                  height: height*0.045,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:Color(0xffccd2d6),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            dowBuilder: (context, date) {
              return Center(
                child: Text(
                  DateFormat.E().format(date)[0],
                  style: TextStyle(
                    color: Color(0xFFAFB7C2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            selectedBuilder: (context, date, _) {
              return Center(
                child: Container(
                  height: height*0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xff24e2b6), Color(0xff2BA7D5)],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                      ),),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          leftChevronIcon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff24e2b6),
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff2BA7D5),
          ),
        ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width*0.1,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "hh",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width:width*0.04),
                Text(':',
                style:TextStyle(
                  fontSize: height*0.04,
                  ),
                ),
                SizedBox(width:width*0.04),
                Container(
                  width: width*0.1,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "mm",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          time=true;
                        });
                      },
                        child: Text('AM',
                        style: TextStyle(
                          fontSize:height*0.015,
                          color:time==true?Colors.black:Color(0xffafb7c2),
                          ),
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          time=false;
                        });
                      },
                        child: Text('PM',
                          style: TextStyle(
                            fontSize:height*0.015,
                            color:time==false?Colors.black:Color(0xffafb7c2),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Text(
              "Past appointments can also be added",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffafb7c2),
                fontSize: height*0.02,
              ),
            ),
            Padding(
              padding:EdgeInsets.only(left:width*0.08, right:width*0.08,top:height*0.01,),
              child: Container(
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
                  child: new Text('Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height*0.02,
                      fontFamily: "Mont",
                    ),),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/addAppoint',);
                  },
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class Todo {
  final String patient;
  final String description;

  Todo(this.patient, this.description);
}