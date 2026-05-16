import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widget/custom_text_field.dart';
import '../widget/profile_image.dart';
import '../widget/submit_btn.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        title: const Text("Flutter Login UI"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 3,
      ),

      body: Center(
        child: Container(
          width: 88.w,
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black12,
                offset: Offset(0, 4),
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ProfileImage(),

              SizedBox(height: 2.h),

              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 1.h),

              Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 9.w,
              ),

              SizedBox(height: 3.h),

              const CustomTextField(hint: "Enter Email"),

              SizedBox(height: 2.h),

              const CustomTextField(
                hint: "Enter Password",
                isPassword: true,
              ),

              SizedBox(height: 3.h),

              const SubmitButton(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.login,
          size: 6.w,
        ),
      ),
    );
  }
}