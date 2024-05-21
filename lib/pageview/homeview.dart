import 'package:cvtracker/constate/Consate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepages extends StatelessWidget {
  const Homepages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(Kprimiarycolor),
          centerTitle: true,
          title: const Text(
            'TRAKER_APPLICATION',
            style: TextStyle(color: Colors.orange),
          )),
      backgroundColor: const Color(Kprimiarycolor),
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: WelcomeScreen(),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(height: 100, 'lib/assets/images/12.png'),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'pages1');
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: const Center(
              child: Text(
                'START',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'mohamed'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'we are tracker team',
                style: TextStyle(
                    color: Colors.orange, fontSize: 30, fontFamily: 'mohamed'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
