part of 'appointment_bloc.dart';

class AppointmentState extends Equatable {
  final LinkedHashMap<DateTime, List<AppointmentInfo>> appointments;
  const AppointmentState({@required this.appointments});
  @override
  List<Object> get props => [appointments];
}

class AppointmentInitial extends AppointmentState {
  final LinkedHashMap<DateTime, List<AppointmentInfo>> appointments;
  const AppointmentInitial({@required this.appointments}) : super(appointments: appointments);
  @override
  List<Object> get props => [appointments];
}
