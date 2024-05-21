import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cvtracker/views/multi_file/data/rate_resume_model.dart';
part 'add_multible_file_state.dart';

class AddMultibleFileCubit extends Cubit<AddMultibleFileState> {
  final TextEditingController jobDescription = TextEditingController();
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 100000),
      receiveTimeout: Duration(milliseconds: 100000),
    ),
  );

  AddMultibleFileCubit() : super(AddMultibleFileInitial());

  List<File> uploadedCvs = []; // List to hold multiple CVs

  Future<void> uploadCvs() async {
    try {
      emit(AddMultibleFileLoading());

      // Allow the user to select multiple files with specific extensions
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'docx'],
        allowMultiple: true,
      );

      if (result != null) {
        uploadedCvs = result.paths.map((path) => File(path!)).toList();
        emit(AddMultibleFileSuccess());
      } else {
        emit(AddMultibleFileFailure(errorMessage: "No files selected."));
      }
    } catch (e) {
      emit(AddMultibleFileFailure(
          errorMessage: "File selection error: ${e.toString()}"));
    }
  }

  Future<void> compareCvsWithJobDescription() async {
    if (uploadedCvs.isEmpty) {
      emit(AddMultibleFileFailure(errorMessage: "No CVs uploaded."));
      return;
    }

    if (jobDescription.text.isEmpty) {
      emit(AddMultibleFileFailure(
          errorMessage: "Job description cannot be empty."));
      return;
    }

    try {
      emit(AddMultibleFileAndTrackItLoading());

      // Create the list of MultipartFile asynchronously
      List<MultipartFile> multipartFiles = [];
      for (var cv in uploadedCvs) {
        multipartFiles.add(await MultipartFile.fromFile(
          cv.path,
          filename: cv.path.split('/').last,
        ));
      }

      // Create FormData with resolved MultipartFiles
      FormData formData = FormData.fromMap({
        "job_description": jobDescription.text,
        "resume": multipartFiles, // Add the list of MultipartFiles
      });

      print(
          "FormData: ${formData.fields}");

      String endpoint = 'http://10.0.2.2:8001/predict'; // Backend endpoint
      Response response = await dio.post(endpoint, data: formData);

      if (response.statusCode == 200) {
        print('${response.data}');
        ResumeResponse resumeResponse = ResumeResponse.fromJson(response.data);
        emit(AddMultibleFileAndTrackItSuccess(
          bestResume: resumeResponse.best,
          results: resumeResponse.results,
        ));
      } else {
        emit(AddMultibleFileAndTrackItFailure(
          errorMessage:
              "Unexpected response: ${response.statusCode} - ${response.data}",
        ));
      }
    } catch (e) {
      emit(AddMultibleFileAndTrackItFailure(
        errorMessage: "Error during POST request: ${e.toString()}",
      ));
    }
  }
}
