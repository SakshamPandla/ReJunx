// ignore_for_file: must_be_immutable

import 'dart:ffi';
import 'dart:math';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  String hinttext;
  bool ifphone;
  final bool ifpassword;
  bool ifname;
  bool ifdob;
  CustomTextField(
      {required this.hinttext,
      this.ifphone = false,
      this.ifpassword = false,
      this.ifname = false,
      this.ifdob = false,
      super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: Container(
        height: 6.5.h,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(226, 226, 226, 1)),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.3.h),
          child: TextFormField(
            obscureText: widget.ifpassword && !passwordVisible,
            style: TextStyle(fontWeight: FontWeight.bold),
            keyboardType: widget.ifphone
                ? TextInputType.phone
                : widget.ifpassword
                    ? TextInputType.visiblePassword
                    : widget.ifname
                        ? TextInputType.name
                        : TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: widget.hinttext,
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                suffixIcon: widget.ifpassword
                    ? IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )
                    : SizedBox.shrink()),
          ),
        ),
      ),
    );
  }
}

class Dob extends StatelessWidget {
  Dob({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: Container(
          height: 7.h,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(226, 226, 226, 1)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: DOBInputField(
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            showLabel: true,
            autovalidateMode: AutovalidateMode.disabled,
            inputDecoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                border: InputBorder.none,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                counterText: '',
                floatingLabelStyle: const TextStyle(
                    color: Color.fromRGBO(117, 117, 117, 1),
                    fontWeight: FontWeight.w400),
                labelStyle: const TextStyle(color: Colors.black)),
            fieldLabelText: "Date Of Birth",
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  String text1;
  CustomFormField({required this.text1,super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
      child: Container(
          height: 10.h,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(226, 226, 226, 1)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.3.h),
            child: TextFormField(
              keyboardType: TextInputType.text,
              maxLines: null,
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration:  InputDecoration(
                labelText: text1,
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}
