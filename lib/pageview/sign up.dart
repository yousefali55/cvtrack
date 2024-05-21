import 'package:cvtracker/constate/Consate.dart';
import 'package:cvtracker/widget/customebutton.dart';
import 'package:cvtracker/widget/custometextfield.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Kprimiarycolor),
        centerTitle: true,
        title: Text(
          ' we are tracker team',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.only(bottom: 70),
        child: ListView(
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset('lib/assets/images/14.png'),
            Row(
              children: [
                Text(
                  'register',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            signin(
              email: 'enter email',
              label: 'username',
            ),
            SizedBox(
              height: 20,
            ),
            signin(
              label: 'password',
              email: 'enter password',
            ),
            SizedBox(
              height: 15,
            ),
            customebutton(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have an account now',
                  style: TextStyle(
                      color: Color(Kprimiarycolor),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'start now',
                style: TextStyle(
                    color: Color(Kprimiarycolor),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
