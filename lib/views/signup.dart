import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/sign_up/signup_cubit.dart';
import 'package:vendorapp/views/homepage.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final txtName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFA4268),
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
                Container(
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
                    "SIGN UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.sp),
                child: const Align(
                    alignment: Alignment.centerLeft, child: Text("Name")),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                child: TextField(
                  controller: txtName,
                  decoration: const InputDecoration(
                    hintText: "Enter Name",
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
                    alignment: Alignment.centerLeft, child: Text("Email")),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                child: TextField(
                  controller: txtEmail,
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
                  controller: txtPass,
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
              BlocListener<SignupCubit, SignupState>(
                listener: (context, state) {
                  if(state is SignupLoading)
                    {
                      showDialog(
                        context: context,
                        builder: (context)=>SizedBox(
                          height: 50.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )

                      );
                    }
                  if(state is SignupLoaded)
                    {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Account Craeted"))
                      );
                    }
                  if(state is SignupError)
                    {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text(state.err))
                      );
                    }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 100.w),
                  child: MaterialButton(
                    height: 60.h,
                    color: const Color(0xff14AE48),
                    onPressed: () async {
                      var data = await payload();
                      context
                          .read<SignupCubit>()
                          .postData(txtEmail.text, txtPass.text, data);

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> payload() async {
    return {
      'name': txtName.text,
      'email': txtEmail.text,
    };
  }
}
