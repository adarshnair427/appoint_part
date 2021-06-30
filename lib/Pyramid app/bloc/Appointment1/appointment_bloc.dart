import 'dart:async';
import 'dart:collection';


// ignore: import_of_legacy_library_into_null_safe
import 'package:appoint_part/Pyramid%20app/Data/appointmentInfo.dart';
import 'package:bloc/bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial(appointments: appointments));

  @override
  Stream<AppointmentState> mapEventToState(
    AppointmentEvent event,
  ) async* {
    if (event is AddAppoint) {
      if (state.appointments.containsKey(event.appointments.dateTime))
        state.appointments[event.appointments.dateTime].add(event.appointments);
      yield AppointmentState(appointments: state.appointments);
    }
  }
}
