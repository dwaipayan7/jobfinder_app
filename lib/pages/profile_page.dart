import 'package:flutter/material.dart';
import 'package:jobfinder_app/models/user_info.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      "https://media.licdn.com/dms/image/v2/D4E03AQFUcpGFAGfQnA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1680274769856?e=2147483647&v=beta&t=5i793SBGLPhnDpydzt5reC4HBJ6L0k8xKZh3WG9VyKs",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Center(
                child: Column(
                  children: [
                    Text(
                      "Dwaipayan Biswas",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Flutter Engineer",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: -.5,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 4.5,
                    animation: true,
                    percent: 0.8,
                    animationDuration: 1000,
                    center: const Text(
                      "80.0%",
                      style: TextStyle(fontSize: 11, color: Colors.blueAccent),
                    ),
                    progressColor: Colors.blueAccent,
                    footer: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Skill Proficiency"),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 4.5,
                    animation: true,
                    percent: 0.7,
                    animationDuration: 1000,
                    center: const Text(
                      "70.0%",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    progressColor: Colors.purpleAccent,
                    footer: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Experience level"),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 4.5,
                    animation: true,
                    percent: 0.95,
                    animationDuration: 1000,
                    center: const Text(
                      "95.0%",
                      style: TextStyle(fontSize: 11, color: Colors.green),
                    ),
                    progressColor: Colors.green,
                    footer: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Profile Completion"),
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 10),
              //
              // Center(
              //   child: Text(
              //     "See All",
              //     style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),

              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Projects, Skill & Experience",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: userInfo.length,
                  itemBuilder: (context, index) {
                    final info = userInfo[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // User Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              info.img,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 15), // Space between image & text

                          // User Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  info.title,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4), // Spacing between title & company
                                Text(
                                  info.company,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
