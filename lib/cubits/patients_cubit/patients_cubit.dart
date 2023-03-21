import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:vendorapp/models/patient_model.dart';
import 'package:vendorapp/sharedpref/login_shared_pref.dart';

part 'patients_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit() : super(PatientsInitial()){
    getPatients();
  }
  getPatients()async{
    try{
      var user=await LoginSharedPref.getdata();
      var me=user?.id;

      List<PatientModel> patients=[];

      emit(PatientsLoading());
      var snapshots=FirebaseFirestore.instance.collection("patients").where("linkedTo",isEqualTo:me).snapshots();
      snapshots.listen((events) {
        patients.clear();
        for(var doc in events.docs){
          var dataModel=PatientModel.fromJson(doc.data());
          patients.add(dataModel);
        }
        emit(PatientsLoaded(patients: patients));
      });

    }catch(e){
      emit(PatientsError(err: e.toString()));
    }
  }
}
