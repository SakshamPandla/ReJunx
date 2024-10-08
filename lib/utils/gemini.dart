import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:rejunx/reusable/button.dart';
import 'package:sizer/sizer.dart';

class GeminiModelChat extends StatefulWidget {
  const GeminiModelChat({super.key});

  @override
  State<GeminiModelChat> createState() => _GeminiModelChatState();
}

class _GeminiModelChatState extends State<GeminiModelChat> {
  late GenerativeModel model;
  TextEditingController _makeYearController = TextEditingController();
  TextEditingController _modelNumberController = TextEditingController();
  TextEditingController _conditionController = TextEditingController();
  TextEditingController _workingController = TextEditingController();
  String _response = '';

  @override
  void initState() {
    model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey:
      'API_Key', // Replace with your actual API key
    );
    super.initState();
  }

  Future<void> generate() async {
    // Show "Response loading..." immediately after the button is pressed
    setState(() {
      _response = 'Response loading...';
    });

    try {
      final prompt = [
        Content.text(
            " You are an e-waste recycling expert, I am trying to sell an electronic item with the following details:\n"
                "Make year: ${_makeYearController.text}\n"
                "Model number: ${_modelNumberController.text}\n"
                "Condition: ${_conditionController.text}\n"
                "Working: ${_workingController.text}\n"
                "Should I recycle this item? Yes or No\n"
                "Just give 3 lines answers"
        )
      ];
      final response = await model.generateContent(prompt);
      setState(() {
        _response = response.text!;
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('Recyclability Assesment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: TextFieldGemini(
                controller: _makeYearController,
                labeltext: 'Make Year',
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: TextFieldGemini(
                controller: _modelNumberController,
                labeltext: 'Model Name',
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: TextFieldGemini(
                controller: _conditionController,
                labeltext: 'Condition',
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: TextFieldGemini(
                controller: _workingController,
                labeltext: 'Working (Yes or No)',
              ),
            ),
            SizedBox(height: 2.h),
            Center(
              child: Button(
                onPressed: generate,
                text: 'Submit',
              ),
            ),
            const SizedBox(height: 20),
            // Conditionally show the container when a response is available or during loading
            if (_response.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.5.w),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade400,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      child: Text(
                        _response,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TextFieldGemini extends StatelessWidget {
  TextEditingController controller;
  String labeltext;
  TextFieldGemini({required this.controller, required this.labeltext, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labeltext,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
