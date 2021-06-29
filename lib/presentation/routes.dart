import 'package:appoint_part/bloc/Appointment1/appointment_bloc.dart';
import 'package:flutter/material.dart';

import 'package:appoint_part/presentation/screens/addAppointment.dart';
import 'package:appoint_part/presentation/screens/appointmentsList.dart';
import 'package:appoint_part/presentation/screens/calendar.dart';
import 'package:appoint_part/presentation/screens/personList.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final AppointmentBloc _blocAppointment = AppointmentBloc();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _blocAppointment,
            child: PersonList(
            title: "List of Patients",
          ),
          ),
        );
      case '/calendar':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _blocAppointment,
            child: Calendar(
            title: "Calendar",
          ),
          ),
        );
      case '/addAppoint':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _blocAppointment,
            child: AddAppointment(
            title: "Add Appointment Details",
          ),
          ),
        );
      case '/appointList':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _blocAppointment,
            child: AppointmentsList(
            title: "Final list showing all appointments",
          ),
          ),
        );
      default:
        return null;
    }
  }
  void dispose(){
    _blocAppointment.close();
  }
}