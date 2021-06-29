part of 'appointment_bloc.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();
}

class AddAppoint extends AppointmentEvent{
  final AppointmentInfo appointments;
  const AddAppoint(this.appointments);
  @override
  List<Object> get props => [appointments];
}