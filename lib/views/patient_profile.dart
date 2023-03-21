import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/views/scan_thumb.dart';
class PatientProfile extends StatelessWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  height: 150.sp,
                  width: 150.sp,
                  child: Image.asset("assets/images/person.png"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "JUSTIN SHA",
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
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    child: const Text("Mobile Number",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10.sp),
                    child: const Text("+921234567890",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),
                    )),
              ),
              SizedBox(height: 5.h,),
              const Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,

              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    child: const Text("Adress",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    child: const Text("Lorem Ipsum is simply dummy text "
                        "of the printing and typesetting industry.")),
              ),
              SizedBox(height: 10.h,),
              const Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,

              ),
              SizedBox(height: 20.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Image.asset("assets/images/map.png"),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100.w),
                child: MaterialButton(
                  height: 60.h,
                  color: const Color(0xff14AE48),
                  onPressed: () {

                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
