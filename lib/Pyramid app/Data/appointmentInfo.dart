import 'dart:collection';


// ignore: import_of_legacy_library_into_null_safe
import 'package:appoint_part/Pyramid%20app/Data/patientList.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentInfo extends Equatable{
  final Patient patient;
  final DateTime dateTime;
  final String disease;
  final String about;

  AppointmentInfo({
    @required this.patient,
    @required this.dateTime,
    @required this.disease,
    @required this.about,
  });

  @override
  List<Object> get props => [
    patient,
    dateTime,
    disease,
    about,
  ];
}

final LinkedHashMap<DateTime, List<AppointmentInfo>> appointments =
LinkedHashMap(equals: isSameDay, hashCode: getHashCode)
  ..addAll({
    DateTime.now(): [
      AppointmentInfo(
          patient: Patient(name: "Adarsh",),
          dateTime: DateTime.now().add(Duration(hours: 2),),
          disease: 'gas',
          about: 'abc',
      ),
      AppointmentInfo(
          patient: Patient(name: "Ada",),
          dateTime: DateTime.now().add(Duration(hours: 2),),
          disease: 'cancer',
          about: 'abc',
      ),
      AppointmentInfo(
          patient: Patient(name: "Baa",),
          dateTime: DateTime.now().subtract(Duration(hours: 2),),
          disease: 'diarrhoea',
          about: 'abc',
      ),
      AppointmentInfo(
          patient: Patient(name: "Ram",),
          dateTime: DateTime.now().subtract(Duration(hours: 2),),
          disease: 'ache',
          about: 'abc',
      ),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
