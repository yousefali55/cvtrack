import 'package:cvtracker/constate/Consate.dart';
import 'package:cvtracker/pageview/signin/signin%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Pages1 extends StatelessWidget {
  Pages1({super.key});
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(Kprimiarycolor),
        centerTitle: true,
        title: const Text(
          'we are tracker team',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 100.h),
        child: PageView(
          controller: controller,
          children: [
            Padding(
              padding: EdgeInsets.all(20.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/images/14.png',height: 150.h,),
                    const Text(
                      'an application developed by students in fourth year in port said community faculity of management technology and information system',
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "mohamed",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/images/14.png'),
                    Image.asset('lib/assets/images/1.png'),
                    const Text(
                      'an application developed by students in fourth year in port said community faculity of management technology and information system',
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "mohamed",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200.h,
                    child: Image.asset('lib/assets/images/14.png')),
                  Container(
                    height: 200.h,
                    child: Image.asset('lib/assets/images/5.png')),
                  const Text(
                    'an application developed by students in fourth year in port said community faculity of management technology and information system',
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "mohamed",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/images/14.png'),
                  Image.asset('lib/assets/images/3.png'),
                  const Text(
                    'an application developed by students in fourth year in port said community faculity of management technology and information system',
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "mohamed",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'sign in now ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(Kprimiarycolor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/images/14.png'),
                  const Text(
                    'SIGN IN TRACKER NOW',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "mohamed",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Signin();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'sign in now ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(Kprimiarycolor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: const Color(Kprimiarycolor),
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(microseconds: 200),
                      curve: Curves.easeIn);
                },
                child: const Text(
                  'pervious',
                  style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'mohamed',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 5,
                effect: const WormEffect(
                    dotColor: Colors.white,
                    spacing: 15,
                    activeDotColor: Colors.orange),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(microseconds: 200),
                    curve: Curves.easeIn);
              },
              child: const Text(
                'NEXT',
                style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'mohamed',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
