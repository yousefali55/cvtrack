import 'package:cvtracker/constate/Consate.dart';
import 'package:flutter/material.dart';
import 'package:cvtracker/views/multi_file/data/cubit/add_multible_file_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CvComparisonScreen extends StatelessWidget {
  final AddMultibleFileAndTrackItSuccess state;

  const CvComparisonScreen({required this.state});

  @override
  Widget build(BuildContext context) {
    final bestResume = state.bestResume;
    final results = state.results;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 45),
                          child: SvgPicture.asset(
                              'lib/assets/svgs/Group6872.svg'))),
                  const SizedBox(height: 30),
                  Text(
                    "Best CV:",
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      color: const Color(Kprimiarycolor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "File Name: ${bestResume.fileName}",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: const Color(Kprimiarycolor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Rank: ${bestResume.evaluation.rank}",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: const Color(Kprimiarycolor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Feedback: ${bestResume.evaluation.feedback}",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: const Color(Kprimiarycolor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // const Divider(),
                  const SizedBox(height: 20),
                  Text(
                    "All CVs:",
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      color: const Color(Kprimiarycolor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap:
                        true, // Ensure ListView takes only necessary space
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling to prevent conflict with SingleChildScrollView
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final cv = results[index];
                      final fileName = cv.fileName;
                      final rank = cv.evaluation.rank;
                      final feedback = cv.evaluation.feedback;

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "File Name: $fileName",
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: const Color(Kprimiarycolor),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Rank: $rank",
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: const Color(Kprimiarycolor),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Feedback: $feedback",
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: const Color(Kprimiarycolor),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
