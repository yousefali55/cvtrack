import 'package:cvtracker/constate/Consate.dart';
import 'package:flutter/material.dart';

class cvname extends StatelessWidget {
  const cvname({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(Kprimiarycolor),
          centerTitle: true,
          title: const Text(
            ' trackerapplication',
            style: TextStyle(color: Colors.orange),
          ),
        ),
        body: Column(
          children: [
            Image.asset('lib/assets/images/7.png'),
            const resultwidget(
              image: 'lib/assets/images/11.png',
              title: 'jobtitle',
            ),
            const resultwidget(
              image: 'lib/assets/images/10.png',
              title: 'experience',
            ),
            resultwidget(
              image: 'lib/assets/images/10.png',
              title: 'education',
            ),
            resultwidget(
              image: 'lib/assets/images/10.png',
              title: 'education',
            ),
          ],
        ));
  }
}

class resultwidget extends StatelessWidget {
  const resultwidget({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          Image.asset(height: 30, width: 30, image),
        ],
      ),
    );
  }
}
