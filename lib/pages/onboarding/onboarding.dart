import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/headphone.PNG"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Explore\nThe Best\nProducts",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
