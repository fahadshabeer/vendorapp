import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/cubits/patients_cubit/patients_cubit.dart';
import 'package:vendorapp/views/customs/custom_list_tile.dart';
import 'package:vendorapp/views/patient_profile.dart';
import 'package:vendorapp/views/scan_thumb.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFA4268),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PatientProfile()));
          },
          child: Container(
              width: 112.w, child: Image.asset("assets/images/hindi.png")),
        ),
      ),
      body: BlocBuilder<PatientsCubit, PatientsState>(
        builder: (context, state) {
          if(state is PatientsLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PatientsError){
            return Center(
              child: Text(state.err),
            );
          }
          if(state is PatientsLoaded) {
            return Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.sp),
                bottomLeft: Radius.circular(30.sp),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: const Text(
                    "Todays's Visit",
                    style: TextStyle(
                        color: Color(0xff757575),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.patients.length,
                  itemBuilder:(context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> ScanThumb(
                              patientId: state.patients[index].id,
                              donationId: state.patients[index].donationId!,
                            ))
                        );
                      },
                      child: CustomListTile(
                        patientModel: state.patients[index],
                      ),
                    );
                  } ,
                )
              ],
            ),
          );
          }
          else{
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 70.h,


        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.event_note_sharp, color: Colors.white,),
            Icon(Icons.home_outlined, color: Colors.white,),
            Icon(Icons.person_outline, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
