import 'package:appoint_part/Data/appointmentInfo.dart';
import 'package:appoint_part/bloc/Appointment1/appointment_bloc.dart';
import 'package:appoint_part/presentation/widgets/appointTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:appoint_part/Data/patientInfo.dart';
import 'package:appoint_part/Data/appointmentInfo.dart';
import 'package:intl/intl.dart';

class AppointmentsList extends StatefulWidget {
  AppointmentsList({@required this.title});

  final String title;

  @override
  _AppointmentsListState createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  List<AppointmentInfo> upcoming=[];
  List<AppointmentInfo> completed=[];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:1,
        leading: IconButton(
          icon: Icon(Icons.account_circle_outlined, color:Color(0xffafb7c2),),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color:Color(0xffafb7c2),),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.messenger_outline, color:Color(0xffafb7c2),),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left:width*0.05, right:width*0.05,),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2021),
            lastDay: DateTime(2022),
            calendarFormat: CalendarFormat.week,
            availableCalendarFormats: {
              CalendarFormat.week: 'Week',
            },
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay =
                    focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              weekendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context,date,_){
                  return Center(
                    child: Container(
                      height: height*0.05,
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
                  Icons.chevron_left,
                  color: Color(0xff24e2b6),
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Color(0xff2BA7D5),
                ),
              ),
            ),
              Padding(
                padding: EdgeInsets.only(bottom:height*0.01, top:height*0.01),
                child: Text(
                  "Upcoming Appointments",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffafb7c2),
                    fontSize: height*0.02,
                  ),
                ),
              ),
              BlocListener<AppointmentBloc, AppointmentState>(
                listener: (context, state){for(AppointmentInfo appointmentInfo in state.appointments[_selectedDay])
                  if(appointmentInfo.dateTime.compareTo(DateTime.now()) >= 0)
                    upcoming.add(appointmentInfo);
                  else
                    completed.add(appointmentInfo);
                return Column(
                  children: [
                    ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: upcoming.length,
                        itemBuilder: (BuildContext context, int index) {
                          AppointmentInfo inf = upcoming[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom:height*0.02),
                            child: Appointment(appointment:inf),
                          );
                        },
                      ),
                    Padding(
                      padding: EdgeInsets.only(bottom:height*0.01, top:height*0.01),
                      child: Text(
                        "Completed Appointments",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffafb7c2),
                          fontSize: height*0.02,
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: completed.length,
                      itemBuilder: (BuildContext context, int index) {
                        AppointmentInfo inf2 = completed[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom:height*0.02),
                          child: Appointment(appointment:inf2),
                        );
                      },
                    ),
                  ],
                );},
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
                    child: new Text('+Add Appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height*0.02,
                        fontFamily: "Mont",
                      ),),
                    onPressed: () {},
                  ),
                ),
            ],
          ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}