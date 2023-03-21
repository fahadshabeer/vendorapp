import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:vendorapp/models/user_data_model.dart';
import 'package:vendorapp/sharedpref/login_shared_pref.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  fetchData(String email, String password) async {
    try {
      emit(LoginLoading());
      var ref = await FirebaseFirestore.instance
          .collection("vendors")
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: password)
          .get();
      if (ref.docs.isNotEmpty) {
        var data = ref.docs.first;
        print(jsonEncode(data.data()));
        var usermodel = UserDataModel.fromJson(data.data()!);
        await LoginSharedPref.setData(usermodel);
        emit(LoginLoaded());
      }else{
        throw Exception("No user record found corresponding to these credentials");
      }
    } catch (e) {
      if (e is FirebaseException) {
        emit(LoginError(err: e.message.toString()));
      } else if (e is SocketException) {
        emit(LoginError(err: e.message.toString()));
      } else if (e is FirebaseAuthException) {
        emit(LoginError(err: e.message.toString()));
      } else {
        emit(LoginError(err: e.toString()));
      }
    }
  }
}
