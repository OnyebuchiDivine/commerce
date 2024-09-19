import 'package:commerce/inro_screens/screen1.dart';
import 'package:commerce/inro_screens/screen2.dart';
import 'package:commerce/inro_screens/screen3.dart';
import 'package:commerce/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            Screen1(),
            Screen2(),
            Screen3(),
          ],
        ),
        Container(
            alignment: Alignment(0,0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                        Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => AuthPage(),
    ),
  );
                        },
                        child: Container(
                          height: screenHeight * 0.04,
                          padding: EdgeInsetsDirectional.only(start: 20,top: 3),
                          width: screenWidth * 0.2,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 131, 221, 134),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "done",
                            style: TextStyle(
                              fontSize: 17,color: Colors.black
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 5),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          "next",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )
              ],
            ))
      ],
    ));
  }
}
