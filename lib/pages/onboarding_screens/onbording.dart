import 'package:flutter/material.dart';
import 'package:skillhunt/pages/reg_login_page/login.dart';
import 'package:skillhunt/pages/onboarding_screens/onb_page_1.dart';
import 'package:skillhunt/pages/onboarding_screens/onb_page_2.dart';
import 'package:skillhunt/pages/onboarding_screens/onb_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();

//keep track of last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              OnbPage1(),
              OnbPage2(),
              OnbPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip//
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text('Skip'),
                ),

                SmoothPageIndicator(controller: _controller, count: 3),

                //next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                         
                          _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
