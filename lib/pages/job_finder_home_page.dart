import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobfinder_app/common/job_items.dart';
import 'package:jobfinder_app/models/company_offer.dart';
import 'package:jobfinder_app/models/job_category_model.dart';
import 'package:jobfinder_app/models/job_opportunity_model.dart';
import 'package:jobfinder_app/pages/all_jobs.dart';
import 'package:jobfinder_app/pages/profile_page.dart';

import '../common/search_bar.dart';

class JobFinderHomePage extends StatefulWidget {
  const JobFinderHomePage({super.key});

  @override
  State<JobFinderHomePage> createState() => _JobFinderHomePageState();
}

class _JobFinderHomePageState extends State<JobFinderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: false,
        leading: IconButton(onPressed: () {}, icon: Icon(Iconsax.menu)),
        title: Text(
          "Find a Perfect Job For You!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileSection(),
              MySearchBar(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      jobCategories
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffF8F5F5),
                                    Color(0xffEEE8F3),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  e.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),

              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Company Offer",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 190,
                margin: EdgeInsets.only(top: 10, left: 10),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children:
                      companyOffer
                          .map((e) => buildPopularCompaniesList(e))
                          .toList(),
                ),
              ),

              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Job Opportunities",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllJobs(),
                              ),
                            );
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 225,
                margin: EdgeInsets.only(left: 10, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children:
                      jobOpportunities.map((e) => JobItems(job: e)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopularCompaniesList(CompanyOffer job) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: job.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(job.logo, height: 40),
                SizedBox(height: 10),
                Text(
                  job.jobTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  job.location,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),

                SizedBox(height: 10),

                Row(
                  children:
                      job.jobTypes
                          .map(
                            (e) => Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(child: Text(e)),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),

          Positioned(
            right: 1,
            bottom: 1,
            top: 1,
            child: Container(
              margin: EdgeInsets.only(top: 30, right: 20),
              child: Text(
                job.salary,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileSection() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(12), // Added padding for better spacing
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                "https://media.licdn.com/dms/image/v2/D4E03AQFUcpGFAGfQnA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1680274769856?e=2147483647&v=beta&t=5i793SBGLPhnDpydzt5reC4HBJ6L0k8xKZh3WG9VyKs",
                height: 60,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12), // Added spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dwaipayan Biswas",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Software Engineer",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: SvgPicture.asset(
                "assets/ic_message.svg",
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
