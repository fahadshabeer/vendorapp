part of 'donation_changes_cubit.dart';


abstract class DonationChangesState {}

class DonationChangesInitial extends DonationChangesState {}
class DonationChangesLoading extends DonationChangesState {}
class DonationChangesLoaded extends DonationChangesState {
  DonationsModel donationsModel;
  DonationChangesLoaded({required this.donationsModel});
}
class DonationChangesError extends DonationChangesState {
  String err;
  DonationChangesError({required this.err});
}
