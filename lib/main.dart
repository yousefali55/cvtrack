import 'package:cvtracker/pageview/homeview.dart';
import 'package:cvtracker/pageview/page1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        routes: {
          'pages1': (context) {
            return Pages1();
          }
        },
        debugShowCheckedModeBanner: false,
        home: const Homepages(),
      ),
    );
  }
}
