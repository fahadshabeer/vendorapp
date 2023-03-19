import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key}) : super(key: key);

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
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Justin Sha",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFA4268),
                          ),
                        ),),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("+911234567890",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  const Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry.",
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
