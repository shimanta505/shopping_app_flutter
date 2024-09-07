import 'package:flutter/material.dart';
import 'package:shopping_app/utils/image_path/image_path.dart';
import 'package:shopping_app/utils/size_utils.dart';
import 'package:shopping_app/widget/support_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImagePath.person,
              height: 300.adaptSize,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.h, right: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Sign In",
                      style: AppWidget.semiBoldTextFieldStyle,
                    ),
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                  Text(
                    "Please Enter the details below ",
                    style: AppWidget.lightTextFieldStyle,
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                  _emailSection(),
                  SizedBox(
                    height: 20.v,
                  ),
                  _passwordSection(),
                  SizedBox(
                    height: 20.v,
                  ),
                  _forgotPasswordSection(),
                  SizedBox(
                    height: 60.v,
                  ),
                  _loginButton(),
                  SizedBox(
                    height: 20.v,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have  an account?",
                        style: AppWidget.lightTextFieldStyle,
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      Text("Sign Up",
                          style: AppWidget.lightTextFieldStyle
                              .copyWith(color: Colors.green))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() => Container(
        height: 60.adaptSize,
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 30.v, right: 30.v),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15.v),
        ),
        child: Center(
          child: Text(
            "LOGIN",
            style:
                AppWidget.semiBoldTextFieldStyle.copyWith(color: Colors.white),
          ),
        ),
      );

  Widget _emailSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: AppWidget.semiBoldTextFieldStyle,
          ),
          SizedBox(
            height: 20.v,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.h),
            decoration: BoxDecoration(color: Color(0xFFF4F5F9)),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
              ),
            ),
          ),
        ],
      );

  Widget _passwordSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: AppWidget.semiBoldTextFieldStyle,
          ),
          SizedBox(
            height: 20.v,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.h),
            decoration: BoxDecoration(color: Color(0xFFF4F5F9)),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
              ),
            ),
          ),
        ],
      );

  Widget _forgotPasswordSection() => Align(
        alignment: Alignment.centerRight,
        child: Text(
          "forgot password?",
          style: TextStyle(
            color: Colors.green,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
