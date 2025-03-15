import 'package:flutter/material.dart';
import 'package:jobfinder_app/common/job_items.dart';
import 'package:jobfinder_app/common/search_bar.dart';
import 'package:jobfinder_app/models/job_opportunity_model.dart';

class AllJobs extends StatelessWidget {
  const AllJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: false,
        title: Text(
          "See All Jobs",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const MySearchBar(),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: jobOpportunities.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return JobItems(job: jobOpportunities[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}