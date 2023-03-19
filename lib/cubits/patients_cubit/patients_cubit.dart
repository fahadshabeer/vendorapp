import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'patients_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit() : super(PatientsInitial());
  getPatients()async{
    try{
      var me="myid";
      emit(PatientsLoading());
      var snapshots=FirebaseFirestore.instance.collection("patients").where("linkToVendor",isEqualTo:me ).snapshots();
      snapshots.listen((events) {

      });
      emit(PatientsLoaded());
    }catch(e){
      emit(PatientsError(err: e.toString()));
    }
  }
}
