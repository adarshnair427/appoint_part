// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Patient extends Equatable{
  final String name;

  Patient({
    @required this.name,
  });
  @override
  List<Object> get props => [name];
}

List<Patient> patients=[
  Patient(
      name:"Adarsh"
  ),
  Patient(
      name:"Ada"
  ),
  Patient(
      name:"Baa"
  ),
  Patient(
      name:"Ram"
  ),
];
