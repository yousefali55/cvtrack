import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cvtracker/views/single_file/data/resume_rate.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_cv_state.dart';

class AddCvCubit extends Cubit<AddCvState> {
  TextEditingController jobDescription = TextEditingController();
  AddCvCubit() : super(AddCvInitial());
  File? uploadedCv;
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 100000000),
      receiveTimeout: Duration(milliseconds: 100000000),
    ),
  );
  Future<void> uploadCv() async {
    try {
      emit(AddCvLoading());

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'docx'],
      );

      if (result != null) {
        uploadedCv = File(result.files.single.path!);
        emit(AddCvSuccess());
      } else {
        emit(AddCvFailure(errorMessage: "No file selected."));
      }
    } catch (e) {
      emit(AddCvFailure(errorMessage: "Exception: $e"));
    }
  }

  Future<void> compareCvWithJobDescription() async {
    if (uploadedCv == null) {
      emit(AddCvFailure(errorMessage: "No CV uploaded."));
      return;
    }
    try {
      emit(AddCvAndTrackLoading());
      if (jobDescription.text.isEmpty) {
        emit(AddCvFailure(errorMessage: "Job description cannot be empty."));
        return;
      }
      FormData formData = FormData.fromMap({
        "resume": await MultipartFile.fromFile(uploadedCv!.path,
            filename: uploadedCv!.path.split('/').last),
      });
      String endpoint =
          'http://10.0.2.2:8000/predict?job_description=${jobDescription.text}';
      Response response = await dio.post(endpoint, data: formData);
      if (response.statusCode == 200) {
        print("Comparison successful: ${response.data}");
        ResumeRate resumeRate = ResumeRate.fromJson(response.data);
        emit(AddCvAndTrackSuccess(resumeRate: resumeRate));
      } else {
        emit(AddCvAndTrackFailure(
          errorMessage: "Server returned status code: ${response.statusCode}",
        ));
      }
    } catch (e) {
      emit(AddCvAndTrackFailure(errorMessage: "Exception: $e"));
    }
  }
}
