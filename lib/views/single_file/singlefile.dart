import 'package:cvtracker/constate/Consate.dart';
import 'package:cvtracker/views/rate_view/rate_view.dart';
import 'package:cvtracker/views/single_file/data/cubit/add_cv_cubit.dart';
import 'package:cvtracker/views/single_file/data/resume_rate.dart';
import 'package:cvtracker/widget/custometextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Singlefile extends StatelessWidget {
  const Singlefile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCvCubit(),
      child: BlocConsumer<AddCvCubit, AddCvState>(
        listener: (context, state) {
          if (state is AddCvSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color(Kprimiarycolor),
                content: Text(
                  "File uploaded successfully!",
                ),
              ),
            );
          } else if (state is AddCvFailure) {
            print(state.errorMessage);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Failed to upload: ${state.errorMessage}")),
            );
          } else if (state is AddCvAndTrackFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed: ${state.errorMessage}")),
            );
            print(state.errorMessage);
          } else if (state is AddCvAndTrackSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color(Kprimiarycolor),
                content: Text("Success")));
            final ResumeRate resumeRate = state.resumeRate;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RateView(
                  feedback: resumeRate.feedback,
                  rate: resumeRate.rank.toString(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(Kprimiarycolor),
              centerTitle: true,
              title: const Text(
                ' single file',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const title(
                    tittle: 'experince',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  signin(
                      email: ' write experince you want',
                      label: 'experince',
                      controller: context.read<AddCvCubit>().jobDescription),
                  const Row(
                    children: [
                      Center(
                        child: title(
                          tittle: 'Upload Cv',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      state is AddCvLoading
                          ? const CircularProgressIndicator(
                              color: Color(Kprimiarycolor),
                            )
                          : TextButton(
                              onPressed: () {
                                context.read<AddCvCubit>().uploadCv();
                              },
                              child: const Text(
                                'upload file',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 50),
                              )),
                      Image.asset(
                        'lib/assets/images/6.png',
                        height: 70,
                        width: 70,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  state is AddCvAndTrackLoading
                      ? const Center(
                        child: CircularProgressIndicator(
                            color: Color(Kprimiarycolor),
                          ),
                      )
                      : TextButton(
                          onPressed: () {
                            context
                                .read<AddCvCubit>()
                                .compareCvWithJobDescription();
                          },
                          child: const Text(
                            'start',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 50),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class title extends StatelessWidget {
  const title({
    super.key,
    required this.tittle,
  });
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            tittle,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
