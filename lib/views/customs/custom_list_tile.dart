import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/models/patient_model.dart';

class CustomListTile extends StatelessWidget {
  final PatientModel patientModel;

  const CustomListTile({Key? key, required this.patientModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.sp),
          height: 135.h,
          width: 400.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Card(
            elevation: 1,
            child: ListTile(
              leading: Image.asset("assets/images/person.png"),
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          patientModel.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFA4268),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.sp,
                      ),
                    ],
                  ),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      patientModel.phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${patientModel.city}, ${patientModel.district}, ${patientModel.state}",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
