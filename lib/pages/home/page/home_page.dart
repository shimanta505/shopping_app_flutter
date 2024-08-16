import 'package:flutter/material.dart';
import 'package:shopping_app/widget/support_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    "images/headphones_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/Tv.png",
  ];
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: AppWidget.lightTextFieldStyle,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Categories",
                  style: AppWidget.semiBoldTextFieldStyle,
                ),
                Text(
                  "see all",
                  style: TextStyle(
                    color: Color(0xFFfd6f3e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
