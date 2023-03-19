import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/views/about_us.dart';
class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFA4268),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 300.h,
            width: 428.w,
            decoration: const BoxDecoration(
              color: Color(0xffFA4268),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
            ),
            child: Center(
              //mainAxisAlignment: MainAxisAlignment.center,
              child: Container(
                  height: 250.sp,
                  width: 250.sp,
                  child: Image.asset("assets/images/like.png"),
                ),


            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 150.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    child: const Text(
                      "THANK YOU",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff14AE48),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    child: const Text(
                      "For your effort you had given food to one patient",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          //fontWeight: FontWeight.bold
                        ),
                    )),
              ),


              SizedBox(
                height: 60.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100.w),
                child: MaterialButton(
                  height: 60.h,
                  color: const Color(0xff14AE48),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                  child: const Text(
                    "RETURN HOME",
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
