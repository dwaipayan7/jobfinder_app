import 'package:flutter/material.dart';
import 'package:jobfinder_app/models/job_opportunity_model.dart';

class JobDetailsPage extends StatelessWidget {
  final JobOpportunity job;
  const JobDetailsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
        ],
        title: Text(
          "Job Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      job.img,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  job.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  job.company,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Job Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            job.jobDescription,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),

                          SizedBox(height: 15),

                          Text(
                            "Requirements",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            job.requirement,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 15),

                          Text(
                            "Experience",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            job.experience,
                            style: TextStyle(fontSize: 16, color: Colors.black,
                            fontWeight: FontWeight.w500
                            ),
                          ),

                          SizedBox(height: 15),

                          Text(
                            "Education",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            job.education,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: double.maxFinite,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.blueAccent,
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
