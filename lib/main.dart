import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/cubits/donation_changes_cubit/donation_changes_cubit.dart';
import 'package:vendorapp/cubits/patients_cubit/patients_cubit.dart';
import 'package:vendorapp/login_in/login_cubit.dart';
import 'package:vendorapp/models/user_data_model.dart';
import 'package:vendorapp/sharedpref/login_shared_pref.dart';
import 'package:vendorapp/sign_up/signup_cubit.dart';
import 'package:vendorapp/views/about_us.dart';
import 'package:vendorapp/views/home.dart';
import 'package:vendorapp/views/homepage.dart';
import 'package:vendorapp/views/patient_profile.dart';
import 'package:vendorapp/views/scan_thumb.dart';
import 'package:vendorapp/views/signup.dart';
import 'package:vendorapp/views/thankyou.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var user=await LoginSharedPref.getdata();
  runApp(MyApp(userDataModel: user));
}

class MyApp extends StatelessWidget {
  final UserDataModel? userDataModel;
  const MyApp({super.key,required this.userDataModel});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SignupCubit()),
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => PatientsCubit()),
            BlocProvider(create: (context) => DonationChangesCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: userDataModel!=null? const Home()
          : const HomePage(),
    );
  }
}
