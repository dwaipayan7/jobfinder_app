import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

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
            ],
          ),
        ),
      ),
    );
  }

  Widget profileSection() {
    return GestureDetector(
      onTap: () {},
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
