import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/views/thankyou.dart';

class ScanThumb extends StatelessWidget {
  const ScanThumb({Key? key}) : super(key: key);

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
            height: 300.h,
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
                    child: const Text(
                      "Scan Patient Thumb Here",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),


              Container(
                height: 210.h ,
                width: 317.w,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Image.asset("assets/images/thumb.png"),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThankYouScreen()));
                  },
                  child: const Text(
                    "NEXT",
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
