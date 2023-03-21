import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendorapp/login_in/login_cubit.dart';
import 'package:vendorapp/views/home.dart';
import 'package:vendorapp/views/signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final txtemail = TextEditingController();
  final txtpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFA4268),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            height: 280.h,
            width: 428.w,
            decoration: const BoxDecoration(
              color: Color(0xffFA4268),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.sp,
                  width: 100.sp,
                  child: Image.asset("assets/images/vendoruser.png"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "VENDOR APP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              SizedBox(
                height: 42.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.sp),
                child: const Align(
                    alignment: Alignment.centerLeft, child: Text("Email")),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                child: TextField(
                  controller: txtemail,
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                    prefixIcon: Icon(Icons.person_outline_sharp),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.sp),
                child: const Align(
                    alignment: Alignment.centerLeft, child: Text("Password")),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                child: TextField(
                  controller: txtpass,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.person_outline_sharp),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0xffFA4268),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 20.sp),
                child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password",
                      style: TextStyle(
                        color: Color(0xffFA4268),
                      ),
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    showDialog(
                        context: context,
                        builder: (context) => SizedBox(
                              height: 50.h,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ));
                  }
                  if (state is LoginLoaded) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login Successful")));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                  if (state is LoginError) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.err)));
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 100.w),
                  child: MaterialButton(
                    height: 60.h,
                    color: const Color(0xff14AE48),
                    onPressed: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString("email", txtemail.text);
                      context
                          .read<LoginCubit>()
                          .fetchData(txtemail.text, txtpass.text);
                      txtemail.clear();
                      txtpass.clear();
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100.w),
                child: MaterialButton(
                  height: 60.h,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                        //color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
