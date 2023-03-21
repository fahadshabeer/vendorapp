part of 'patients_cubit.dart';


abstract class PatientsState {}

class PatientsInitial extends PatientsState {}
class PatientsLoading extends PatientsState {}
class PatientsLoaded extends PatientsState {
  List<PatientModel> patients;
  PatientsLoaded({required this.patients});
}
class PatientsError extends PatientsState {
  String err;
  PatientsError({required this.err});
}
