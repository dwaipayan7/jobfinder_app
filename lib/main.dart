import 'package:flutter/material.dart';
import 'package:jobfinder_app/pages/all_jobs.dart';
import 'package:jobfinder_app/pages/job_finder_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: JobFinderHomePage(),
      // home: AllJobs(),
    );
  }
}

