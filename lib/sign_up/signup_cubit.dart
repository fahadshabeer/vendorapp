import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  postData(String email, String password, Map<String, dynamic> data) async {
    try {
      emit(SignupLoading());
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection('userdata')
            .doc(userCredential.user!.uid)
            .set(data);
      }
      emit(SignupLoaded());
    } catch (e) {
      if (e is FirebaseException) {
        emit(SignupError(err: e.message.toString()));
      }
      if (e is SocketException) {
        emit(SignupError(err: e.message.toString()));
      } else {
        emit(SignupError(err: e.toString()));
      }
    }
  }
}
