import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/views/homepage.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff453BC9) ,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MY PROFILE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Color(0xffFA4268),
        actions: [
          InkWell(
            onTap: () async {
              final FirebaseAuth auth = FirebaseAuth.instance;
              await auth.signOut();
              if (FirebaseAuth.instance.currentUser == null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 20.w),
              height: 40.h,
              width: 40.w,
              child: Image.asset("assets/images/logout.png"),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(40.sp)),
              color: Color(0xffFA4268),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Image.asset("assets/images/austin.png"),
                ),
                const Text(
                  "Austin Distal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
                const Text(
                  " Spec. Neurologist",
                  style: TextStyle(color: Colors.white),
                ),
                //Image.asset("assets/images/star.png"),
                const Text(
                  " 2.4(12Review) ",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: 730.h,
            width: 428.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40.sp))),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About US",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "He has been precticing intergrative family medicine for more than 10 years."
                    "Having discovered amore holostice approach as a doctor He has been precticing intergrative "
                    "family medicine for more than 10 years."
                    "Having discovered amore holostice approach as a doctor",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "12 reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "see all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Card(
                        elevation: 2,
                        child: SizedBox(
                          height: 80.h,
                          width: 390.w,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5.sp),
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                child: Image.asset("assets/images/manish.png"),
                              ),
                            ),
                            title: const Text(
                              "manish finch",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                                "Monice is not only skilled and profiencent."
                                " Monice is not only skilled and profiencent."),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                          height: 80.h,
                          width: 390.w,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5.sp),
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                child: Image.asset("assets/images/manish.png"),
                              ),
                            ),
                            title: const Text(
                              "manish finch",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                                "Monice is not only skilled and profiencent."
                                " Monice is not only skilled and profiencent."),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                          height: 80.h,
                          width: 390.w,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5.sp),
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                child: Image.asset("assets/images/manish.png"),
                              ),
                            ),
                            title: const Text(
                              "manish finch",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                                "Monice is not only skilled and profiencent."
                                " Monice is not only skilled and profiencent."),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Vedio Reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "see all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        height: 210.h,
                        width: 310.w,
                        child: Card(
                          elevation: 2,
                          child: Column(
                            children: [
                              Container(
                                  child:
                                      Image.asset('assets/images/Youtube.png')),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 40.h,
                                      width: 40.w,
                                      child: Image.asset(
                                          'assets/images/manish.png')),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text("Manish finch")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 210.h,
                        width: 310.w,
                        child: Card(
                          elevation: 2,
                          child: Column(
                            children: [
                              Container(
                                  child:
                                      Image.asset('assets/images/Youtube.png')),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 40.h,
                                      width: 40.w,
                                      child: Image.asset(
                                          'assets/images/manish.png')),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text("Manish finch")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 210.h,
                        width: 310.w,
                        child: Card(
                          elevation: 2,
                          child: Column(
                            children: [
                              Container(
                                  child:
                                      Image.asset('assets/images/Youtube.png')),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 40.h,
                                      width: 40.w,
                                      child: Image.asset(
                                          'assets/images/manish.png')),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text("Manish finch")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
