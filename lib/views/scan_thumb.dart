import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendorapp/cubits/donation_changes_cubit/donation_changes_cubit.dart';
import 'package:vendorapp/views/thankyou.dart';

class ScanThumb extends StatefulWidget {
  final String patientId;
  final String donationId;

  const ScanThumb({Key? key, required this.patientId, required this.donationId})
      : super(key: key);

  @override
  State<ScanThumb> createState() => _ScanThumbState();
}

class _ScanThumbState extends State<ScanThumb> {
  File? img;
  @override
  void initState() {
    context.read<DonationChangesCubit>().donationChanges(widget.donationId);
    super.initState();
  }
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
          BlocBuilder<DonationChangesCubit, DonationChangesState>(
            builder: (context, state) {
              if(state is DonationChangesLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is DonationChangesError){
                return  Center(
                  child: Text(state.err),
                );
              }
              if(state is DonationChangesLoaded) {
                return ListView(
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
                          "Scan Patient Thumb Here",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),


                  InkWell(
                    onTap:()async{
                      XFile? file=await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(file!=null){
                        img=File(file!.path);
                        setState(() {

                        });
                      }
                    },
                    child: Container(
                      height: 210.h,
                      width: 317.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child:img!=null?
                          Image.file(img!)
                          :Image.asset("assets/images/thumb.png"),
                    ),
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
                            MaterialPageRoute(builder: (context) =>
                                ThankYouScreen()));
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
              );
              }
              else{
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
