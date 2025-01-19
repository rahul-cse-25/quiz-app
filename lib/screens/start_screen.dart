import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testlineiq/extensions/theme.dart';
import 'package:testlineiq/screens/loading.dart';
import 'package:testlineiq/utils/customize_style.dart';

import '../provider/home.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String profilePic = '';
  String userName = 'Imp Unique';
  String appName = 'TestLine IQ';
  List<String> categories = [
    "Science",
    "Maths",
    "History",
    "Geography",
    "Computer",
    "English",
    "Physics",
    "Chemistry",
    "Biology"
  ];
  int selectCategory = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.extraContrast,
        statusBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            TestlineCustomizeStyle testStyle =
                TestlineCustomizeStyle.init(constraints, orientation);
            return Scaffold(
              backgroundColor: context.extraContrast,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Appbar
                    _buildAppBar(testStyle),
                    // Body
                    _buildBody(testStyle),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBody(TestlineCustomizeStyle testStyle) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: testStyle.testlineAllScreenPadding(),
              child: Text("Let's Continue with TestLine IQ",
                  style: TextStyle(
                      color: context.textColor,
                      fontSize: testStyle.sizes.textMultiplier * 2,
                      fontWeight: FontWeight.bold)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(
                          left: testStyle.sizes.horizontalBlockSize * 4),
                      constraints: BoxConstraints(
                        maxWidth: testStyle.sizes.screenWidth * 0.8,
                        // maxHeight: testStyle.sizes.screenWidth * 0.4
                      ),
                      padding: testStyle.testlineAllScreenPadding(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            testStyle.sizes.horizontalBlockSize * 7.5),
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurpleAccent,
                            Colors.deepPurple,
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Transform.scale(
                            scale: 1.7,
                            child: testStyle.testlineLottieImage(
                                'assets/json/shine.json',
                                widthInPercent: 25),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    categories[
                                        Random().nextInt(categories.length)],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            testStyle.sizes.textMultiplier *
                                                1.8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('10 Questions',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              testStyle.sizes.textMultiplier *
                                                  1.2,
                                          fontWeight: FontWeight.bold)),
                                  testStyle.testlineVerticalGap(
                                      verticalGapSizeInPercent: 2),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(
                                              testStyle.sizes.screenWidth *
                                                  0.35,
                                              testStyle.sizes.screenHeight *
                                                  0.05),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                testStyle.sizes
                                                        .horizontalBlockSize *
                                                    4.0),
                                          )),
                                      onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Loading(),
                                          )),
                                      child: Text(
                                        "Start Quiz",
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize:
                                                testStyle.sizes.textMultiplier *
                                                    1.5,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Transform.scale(
                                  scale: 1.2,
                                  child: testStyle.testlineLottieImage(
                                      'assets/json/box.json',
                                      widthInPercent: 35))
                            ],
                          ),
                        ],
                      ),
                    ),
                  testStyle.testlineHorizontalGap(
                      horizontalGapSizeInPercent: 4),
                ],
              ),
            ),
            testStyle.testlineVerticalGap(verticalGapSizeInPercent: 2),
            Padding(
              padding: testStyle.testlineAllScreenPadding(ver: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Friends",
                    style: TextStyle(
                        color: context.textColor,
                        fontSize: testStyle.sizes.textMultiplier * 2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: testStyle.sizes.textMultiplier * 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            testStyle.testlineVerticalGap(verticalGapSizeInPercent: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 10; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          left: testStyle.sizes.horizontalBlockSize * 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: testStyle.testlineAllScreenPadding(hor: 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.isDarkMode
                                  ? Colors.grey.shade700
                                  : Colors.grey.shade500,
                              border: Border.all(
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  width: 2),
                            ),
                            child: Icon(
                              Icons.person,
                              size: testStyle.sizes.textMultiplier * 4,
                              color: Colors.white,
                            ),
                          ),
                          testStyle.testlineVerticalGap(
                              verticalGapSizeInPercent: 0.5),
                          Text(
                            "User $i",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: context.textColor,
                                fontSize: testStyle.sizes.textMultiplier * 1.2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  testStyle.testlineHorizontalGap(
                      horizontalGapSizeInPercent: 4),
                ],
              ),
            ),
            testStyle.testlineVerticalGap(verticalGapSizeInPercent: 1),
            Padding(
              padding: testStyle.testlineAllScreenPadding(ver: 0),
              child: Text(
                "Categories",
                style: TextStyle(
                    color: context.textColor,
                    fontSize: testStyle.sizes.textMultiplier * 2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            testStyle.testlineVerticalGap(verticalGapSizeInPercent: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...categories.map(
                    (cat) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectCategory = categories.indexOf(cat);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: testStyle.sizes.horizontalBlockSize * 4),
                        padding: testStyle.testlineAllScreenPadding(),
                        decoration: BoxDecoration(
                          color: selectCategory == categories.indexOf(cat)
                              ? Colors.deepPurpleAccent
                              : Colors.transparent,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(
                              testStyle.sizes.screenWidth),
                        ),
                        child: Text(
                          cat,
                          style: TextStyle(
                              color: selectCategory == categories.indexOf(cat)
                                  ? Colors.white
                                  : context.textColor,
                              fontSize: testStyle.sizes.textMultiplier * 2.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  testStyle.testlineHorizontalGap(
                      horizontalGapSizeInPercent: 4),
                ],
              ),
            ),
            testStyle.testlineVerticalGap(verticalGapSizeInPercent: 1),
            Padding(
              padding: testStyle.testlineAllScreenPadding(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Quizzes",
                    style: TextStyle(
                        color: context.textColor,
                        fontSize: testStyle.sizes.textMultiplier * 2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: testStyle.sizes.textMultiplier * 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            testStyle.testlineVerticalGap(verticalGapSizeInPercent: 1),
            for (int i = 0; i < 5; i++)
              Container(
                margin: testStyle.testlineAllScreenPadding(ver: 0.5),
                padding: testStyle.testlineAllScreenPadding(hor: 1, ver: 1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  color: context.isDarkMode
                      ? Colors.grey.shade800
                      : Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(
                      testStyle.sizes.horizontalBlockSize * 7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(
                              testStyle.sizes.horizontalBlockSize * 6),
                        ),
                        child: testStyle.testlineLottieImage(
                            'assets/json/calm_girl.json',
                            widthInPercent: 30)),
                    Column(
                      children: [
                        Text(
                          "${categories[Random().nextInt(categories.length)]} Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: testStyle.sizes.textMultiplier * 2,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "10 Questions",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: testStyle.sizes.textMultiplier * 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: testStyle.testlineAllScreenPadding(ver: 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: testStyle.sizes.textMultiplier * 3,
                      ),
                    ),
                  ],
                ),
              ),
            testStyle.testlineVerticalGap(verticalGapSizeInPercent: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(TestlineCustomizeStyle testStyle) {
    return Padding(
      padding: testStyle.testlineAllScreenPadding(ver: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: testStyle.sizes.verticalBlockSize * 0.8,
                  left: testStyle.sizes.horizontalBlockSize * 6,
                  child: Text(
                    userName,
                    style: TextStyle(
                        color: Color(0xff495057),
                        fontSize: testStyle.sizes.textMultiplier * 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      appName.substring(0, 1),
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: testStyle.sizes.textMultiplier * 4.5,
                          fontWeight: FontWeight.bold),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.deepPurple,
                      highlightColor: Colors.deepPurpleAccent,
                      period: Duration(seconds: 2),
                      child: Text(
                        appName.substring(1),
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: testStyle.sizes.textMultiplier * 2.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Consumer<HomeProvider>(
            builder: (context, menuProvider, child) {
              return PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                color: Colors.deepPurpleAccent,
                // elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      testStyle.sizes.horizontalBlockSize * 3),
                ),
                offset: Offset(
                  testStyle.sizes.horizontalBlockSize * 4.0,
                  testStyle.sizes.horizontalBlockSize * 12,
                ),
                onOpened: () => menuProvider.toggleMenu(true),
                onCanceled: () => menuProvider.toggleMenu(false),
                onSelected: (value) {
                  if (value == "Profile") {
                    menuProvider.toggleMenu(false);
                  }
                  if (value == "Settings") {
                    menuProvider.toggleMenu(false);
                  }
                  if (value == "Light" || value == "Dark") {
                    menuProvider.toggleMenu(false);
                    context.toggleTheme();
                  }
                },
                itemBuilder: (context) {
                  return {
                    context.isDarkMode ? "Light" : "Dark",
                    "Profile",
                    "Settings",
                  }.map((String popListChoice) {
                    return PopupMenuItem<String>(
                      padding:
                          testStyle.testlineAllScreenPadding(ver: 2, hor: 3),
                      value: popListChoice,
                      child: Row(
                        children: [
                          Icon(
                            popListChoice == "Settings"
                                ? Icons.settings
                                : popListChoice == "Profile"
                                    ? Icons.person
                                    : context.isDarkMode
                                        ? Icons.light_mode
                                        : Icons.dark_mode,
                            color: Colors.white,
                            size: testStyle.sizes.textMultiplier * 2.5,
                          ),
                          testStyle.testlineHorizontalGap(
                              horizontalGapSizeInPercent: 2.0),
                          Text(
                            popListChoice,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 1.5 * testStyle.sizes.textMultiplier),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                splashRadius: 0,
                child: Container(
                  padding: testStyle.testlineAllScreenPadding(ver: 1, hor: 1),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(testStyle.sizes.screenWidth),
                    color: context.isDarkMode
                        ? Colors.grey.shade100
                        : Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withValues(
                              alpha: context.isDarkMode ? 0.7 : 0.3),
                          spreadRadius: 2,
                          // blurRadius: 7,
                          blurStyle:
                              BlurStyle.inner // changes position of shadow
                          ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (menuProvider.isMenuOpen)
                        testStyle.testlineHorizontalGap(
                            horizontalGapSizeInPercent: 1),
                      if (!menuProvider.isMenuOpen)
                        _buildProfileIcon(testStyle),
                      if (menuProvider.isMenuOpen) _buildMenuBarIcon(testStyle),
                      testStyle.testlineHorizontalGap(
                          horizontalGapSizeInPercent: 1),
                      if (menuProvider.isMenuOpen) _buildProfileIcon(testStyle),
                      if (!menuProvider.isMenuOpen)
                        _buildMenuBarIcon(testStyle),
                      if (!menuProvider.isMenuOpen)
                        testStyle.testlineHorizontalGap(
                            horizontalGapSizeInPercent: 1)
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileIcon(TestlineCustomizeStyle testStyle) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: testStyle.sizes.textMultiplier * 4,
          maxWidth: testStyle.sizes.textMultiplier * 4),
      decoration: BoxDecoration(
          color:
              profilePic.isEmpty ? Colors.deepPurpleAccent : Colors.transparent,
          image: profilePic.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(profilePic), fit: BoxFit.cover),
          shape: BoxShape.circle),
      child: profilePic.isNotEmpty
          ? null
          : Center(
              child: Icon(
              Icons.person,
              color: Colors.white,
              size: testStyle.sizes.textMultiplier * 3.0,
            )),
    );
  }

  Widget _buildMenuBarIcon(TestlineCustomizeStyle testStyle) {
    return Icon(
      Icons.menu,
      size: testStyle.sizes.textMultiplier * 3,
      color: Colors.deepPurpleAccent,
    );
  }
}
