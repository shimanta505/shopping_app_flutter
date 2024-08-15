import 'package:flutter/material.dart';
import 'package:shopping_app/widget/support_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey, Shivam",
                      style: AppWidget.boldTextFieldStyle,
                    ),
                    Text(
                      "Good Morning",
                      style: AppWidget.lightTextFieldStyle,
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("images/boy.jpg",
                      height: 80, width: 80, fit: BoxFit.cover),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
