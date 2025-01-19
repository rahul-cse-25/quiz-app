import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testlineiq/extensions/theme.dart';
import 'package:testlineiq/screens/quiz_screen.dart';
import 'package:testlineiq/utils/customize_style.dart';

import '../models/quiz.dart';
import '../services/api_services.dart';
import '../utils/debug_purpose.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    try {
      Quiz quiz = await _apiService.fetchQuizData();
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => QuizScreen(quiz: quiz)),
      );
    } catch (e) {
      printRed('Error fetching quiz data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.extraContrast,
        statusBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: context.extraContrast,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TestlineCustomizeStyle().testlineLottieImage(
                  "assets/json/panda.json",
                  widthInPercent: 100),
              Text(
                "Loading...",
                style: TextStyle(
                  fontSize: TestlineCustomizeStyle().sizes.textMultiplier * 3,
                  color: context.textColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
