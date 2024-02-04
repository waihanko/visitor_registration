import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:visitor_registration/app/data_source/local/vo/visitor_data_vo.dart';

import 'app/constant/app_constants.dart';
import 'app/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(VisitorDataVoAdapter());
  await Hive.openBox<VisitorDataVo>(kBoxNameForVisitorData);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visitor Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
