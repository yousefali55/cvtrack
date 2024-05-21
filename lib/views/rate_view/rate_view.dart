import 'package:cvtracker/constate/Consate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RateView extends StatelessWidget {
  final String rate;
  final String feedback;
  const RateView({super.key, required this.rate, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 45),
                      child: SvgPicture.asset('lib/assets/svgs/Group6872.svg')),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Rate: $rate',
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      color: const Color(Kprimiarycolor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    maxLines: 6,
                    'Feed back: $feedback',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: const Color(Kprimiarycolor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(Kprimiarycolor),
                      minimumSize: const Size(350, 60),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Try Again',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
