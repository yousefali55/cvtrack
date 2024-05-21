import 'package:cvtracker/constate/Consate.dart';
import 'package:cvtracker/views/mulible_file_result/multible_file_result.dart';
import 'package:cvtracker/views/multi_file/data/cubit/add_multible_file_cubit.dart';
import 'package:cvtracker/widget/custometextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Multiplefile extends StatelessWidget {
  const Multiplefile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMultibleFileCubit(),
      child: BlocConsumer<AddMultibleFileCubit, AddMultibleFileState>(
        listener: (context, state) {
          if (state is AddMultibleFileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color(Kprimiarycolor),
                content: Text(
                  "Files uploaded successfully!",
                ),
              ),
            );
          } else if (state is AddMultibleFileAndTrackItSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color(Kprimiarycolor),
                content: Text(
                  "Success",
                ),
              ),
            );
            Navigator.push(context, MaterialPageRoute(builder: (_)=> CvComparisonScreen(state: state)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(Kprimiarycolor),
              centerTitle: true,
              title: const Text(
                ' multiple file',
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
                  signin(
                    email: ' write experince you want',
                    label: 'experince',
                    controller:
                        context.read<AddMultibleFileCubit>().jobDescription,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            context.read<AddMultibleFileCubit>().uploadCvs();
                          },
                          child: const Text(
                            'upload files',
                            style: TextStyle(color: Colors.black, fontSize: 50),
                          )),
                      Image.asset(
                        'lib/assets/images/6.png',
                        height: 70,
                        width: 70,
                      ),
                    ],
                  ),
                  state is AddMultibleFileAndTrackItLoading
                      ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(Kprimiarycolor),
                        ),
                      )
                      : TextButton(
                          onPressed: () {
                            context
                                .read<AddMultibleFileCubit>()
                                .compareCvsWithJobDescription();
                          },
                          child: const Text(
                            'start',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 50),
                          )),
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
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
