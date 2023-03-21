import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:vendorapp/models/donations_model.dart';

part 'donation_changes_state.dart';

class DonationChangesCubit extends Cubit<DonationChangesState> {
  DonationChangesCubit() : super(DonationChangesInitial());
  
  donationChanges(String donationId)async{
    try{

      emit(DonationChangesLoading());
      var snapshot= FirebaseFirestore.instance.collection("donardata").doc(donationId).snapshots();
      snapshot.listen((event) {
        DonationsModel model=DonationsModel.fromJson(event.data()!);
        emit(DonationChangesLoaded(donationsModel: model));
      });
    }catch(e){
      emit(DonationChangesError(err: e.toString()));
    }
  }
}
