import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/size_utils.dart';
import 'package:shopping_app/widget/support_widget.dart';

class AddProductAdmin extends StatefulWidget {
  const AddProductAdmin({super.key});

  @override
  State<AddProductAdmin> createState() => _AddProductAdminState();
}

class _AddProductAdminState extends State<AddProductAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Add Product",
          style: AppWidget.semiBoldTextFieldStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.h, right: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Upload The Product Image",
              style: AppWidget.semiBoldTextFieldStyle,
            ),
            SizedBox(
              height: 20.v,
            ),
            Center(
              child: Container(
                height: 150.adaptSize,
                width: 150.adaptSize,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20.v)),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
            SizedBox(
              height: 20.v,
            ),
            Text(
              "Product Name",
              style: AppWidget.lightTextFieldStyle,
            ),
            SizedBox(
              height: 20.v,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              width: Get.width,
              //  height: 30.adaptSize,gggccczcz
              decoration: BoxDecoration(
                color: Color(0xffc5c5d6),
                borderRadius: BorderRadius.circular(20.v),
              ),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
