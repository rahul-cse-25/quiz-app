import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testlineiq/extensions/theme.dart';
import 'package:testlineiq/models/answer.dart';
import 'package:testlineiq/screens/loading.dart';
import 'package:testlineiq/utils/customize_style.dart';

import '../models/quiz.dart';

class ResultScreen extends StatefulWidget {
  final List<Answer> selectedAnswers;
  final Quiz quiz;

  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.quiz});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TestlineCustomizeStyle testStyle = TestlineCustomizeStyle();
  int totalScore = 0;
  int totalQuestions = 0;
  String lottiePath = '';
  String? popperPath;
  AnimationController? animationController;
  double percentage = 0.0;
  String motivationalQuote = '';

  @override
  void initState() {
    super.initState();
    _calculateScore();
  }

  void _calculateScore() {
    int score = 0;
    for (var question in widget.quiz.questions) {
      for (var answer in widget.selectedAnswers) {
        if (question.id == answer.questionId) {
          if (answer.isCorrect != null && answer.isCorrect!) {
            score++;
          }
        }
      }
    }

    percentage = (score / widget.selectedAnswers.length) * 100;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        totalScore = score;
        totalQuestions = widget.selectedAnswers.length;
        if (percentage >= 80) {
          lottiePath = 'assets/json/won.json';
          popperPath = 'assets/json/party.json';
          motivationalQuote =
              'Outstanding! Your hard work is paying off. Keep it up!';
        } else if (percentage >= 40) {
          lottiePath = 'assets/json/normal.json';
          motivationalQuote =
              'Nice job! You’re almost there. Let’s aim higher next time!';
        } else {
          lottiePath = 'assets/json/fail.json';
          motivationalQuote =
              'Don’t be discouraged. Every mistake is a lesson learned. You can do it!';
        }
      });
    });
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
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          testStyle.testlineAllScreenPadding(hor: 4, ver: 0),
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {
                          Navigator.popUntil(
                            context,
                            (route) => route.isFirst,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: testStyle.sizes.textMultiplier * 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: testStyle.testlineAllScreenPadding(ver: 0),
                      child: Text('Result: ${percentage.toStringAsFixed(2)}%',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: testStyle.sizes.textMultiplier * 2,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      lottiePath != ''
                          ? Transform.scale(
                              scale: percentage >= 80
                                  ? 1
                                  : percentage >= 40
                                      ? 1.5
                                      : 1,
                              child: testStyle.testlineLottieImage(lottiePath,
                                  widthInPercent: 100),
                            )
                          : SizedBox.shrink(),
                      Shimmer.fromColors(
                        baseColor: Colors.deepPurple,
                        highlightColor: Colors.deepPurpleAccent,
                        period: Duration(seconds: 5),
                        child: Padding(
                          padding: testStyle.testlineAllScreenPadding(),
                          child: Text(
                            'You scored $totalScore out of $totalQuestions',
                            style: TextStyle(
                                fontSize: testStyle.sizes.textMultiplier * 3,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: testStyle.testlineAllScreenPadding(),
                        child: Text(motivationalQuote,
                            style: TextStyle(
                                fontSize: testStyle.sizes.textMultiplier * 2,
                                fontWeight: FontWeight.bold,
                                color: context.textColor)),
                      ),
                      testStyle.testlineVerticalGap(
                          verticalGapSizeInPercent: 2),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loading(),
                            ),
                            (route) => route.isFirst,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              testStyle.sizes.horizontalBlockSize * 92,
                              testStyle.sizes.verticalBlockSize * 6),
                          padding: testStyle.testlineAllScreenPadding(ver: 4),
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                testStyle.sizes.horizontalBlockSize * 5.5),
                          ),
                        ),
                        child: Text(
                          'Play Again',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: testStyle.sizes.textMultiplier * 2),
                        ),
                      ),
                      testStyle.testlineVerticalGap(
                          verticalGapSizeInPercent: 2),
                      TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              testStyle.sizes.horizontalBlockSize * 92,
                              testStyle.sizes.verticalBlockSize * 6),
                          padding: testStyle.testlineAllScreenPadding(ver: 4),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                testStyle.sizes.horizontalBlockSize * 5.5),
                          ),
                        ),
                        child: Text(
                          'See your answers',
                          style: TextStyle(
                              color: context.textColor,
                              fontSize: testStyle.sizes.textMultiplier * 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (popperPath != null)
            IgnorePointer(
              child: testStyle.testlineLottieImage(popperPath!,
                  widthInPercent: 100),
            )
        ],
      ),
    );
  }
}
