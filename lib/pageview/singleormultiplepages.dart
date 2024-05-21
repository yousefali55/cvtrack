import 'package:cvtracker/constate/Consate.dart';
import 'package:cvtracker/views/multi_file/multiplefile.dart';
import 'package:cvtracker/views/single_file/singlefile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Singlrormultible extends StatelessWidget {
  Singlrormultible({super.key});
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(Kprimiarycolor),
        centerTitle: true,
        title: const Text(
          'features',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: PageView(
        controller: controller,
        children: [
          pageviewinsingle(
            ontap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Multiplefile();
              }));
            },
            image: 'lib/assets/images/4.png',
            name2: 'multiple_cv',
            message: 'continue with multiple_cv',
          ),
          pageviewinsingle(
              ontap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Singlefile();
                }));
              },
              image: 'lib/assets/images/5.png',
              name2: 'single_cv',
              message: 'continue with single_cv'),
        ],
      ),
      bottomSheet: Container(
        color: Color(Kprimiarycolor),
        padding: const EdgeInsets.symmetric(horizontal: 40),
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
                child: Text(
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
                count: 2,
                effect: WormEffect(
                    dotColor: Colors.white,
                    spacing: 15,
                    activeDotColor: Colors.orange),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.nextPage(
                    duration: Duration(microseconds: 200),
                    curve: Curves.easeIn);
              },
              child: Text(
                'next',
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

class pageviewinsingle extends StatelessWidget {
  pageviewinsingle(
      {super.key,
      required this.message,
      required this.name2,
      required this.image,
      required this.ontap});
  final String message;
  final String name2;
  final String image;
  late Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          singleormultiple(name: name2),
          Container(child: Image.asset(image),
          height: 180,),
          Text(
            'examine a variety of cvs and choose the differnt ones based on the instructions you specifity',
            maxLines: 3,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "mohamed",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onDoubleTap: ontap,
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(Kprimiarycolor),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class singleormultiple extends StatelessWidget {
  const singleormultiple({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Text(
        name,
        maxLines: 3,
        style: TextStyle(
            color: Colors.orange,
            fontFamily: "mohamed",
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
