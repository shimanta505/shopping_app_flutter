import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/size_utils.dart';

import '../utils/image_path/image_path.dart';
import '../widget/support_widget.dart';

class AdminSignin extends StatefulWidget {
  const AdminSignin({super.key});

  @override
  State<AdminSignin> createState() => _AdminSigninState();
}

class _AdminSigninState extends State<AdminSignin> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  loginAdmin() async {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['username'] != emailController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'username isn\'t correct',
                style: TextStyle(
                  fontSize: 20.fSize,
                ),
              )));
        } else if (result.data()['password'] !=
            passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'password isn\'t correct',
                style: TextStyle(
                  fontSize: 20.fSize,
                ),
              )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'Login successfully',
                style: TextStyle(
                  fontSize: 20.fSize,
                ),
              )));
        }
      });
    });
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Admin Panel',
                        style: AppWidget.semiBoldTextFieldStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20.v,
                    ),

                    SizedBox(
                      height: 20.v,
                    ),
                    _userNameSection(),
                    SizedBox(
                      height: 20.v,
                    ),
                    _passwordSection(),
                    SizedBox(
                      height: 20.v,
                    ),
                    _forgotPasswordSection(),
                    SizedBox(
                      height: 20.v,
                    ),
                    _loginButton(),
                    SizedBox(
                      height: 20.v,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Don't have  an account?",
                    //       style: AppWidget.lightTextFieldStyle,
                    //     ),
                    //     SizedBox(
                    //       width: 20.h,
                    //     ),
                    //     InkWell(
                    //       onTap: () => Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => const SignUpPage())),
                    //       child: Text('Sign Up',
                    //           style: AppWidget.lightTextFieldStyle
                    //               .copyWith(color: Colors.green)),
                    //     )
                    //   ],
                    // )
                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() => InkWell(
        onTap: () {
          loginAdmin();
        },
        child: Container(
          height: 60.adaptSize,
          width: double.maxFinite,
          margin: EdgeInsets.only(left: 30.v, right: 30.v),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15.v),
          ),
          child: Center(
            child: Text(
              'LOGIN',
              style: AppWidget.semiBoldTextFieldStyle
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      );

  Widget _userNameSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: AppWidget.semiBoldTextFieldStyle,
          ),
          SizedBox(
            height: 20.v,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.h),
            decoration: const BoxDecoration(color: Color(0xFFF4F5F9)),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
              ),
            ),
          ),
        ],
      );

  Widget _passwordSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: AppWidget.semiBoldTextFieldStyle,
          ),
          SizedBox(
            height: 20.v,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.h),
            decoration: const BoxDecoration(color: Color(0xFFF4F5F9)),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
              ),
            ),
          ),
        ],
      );

  Widget _forgotPasswordSection() => Align(
        alignment: Alignment.centerRight,
        child: Text(
          'forgot password?',
          style: TextStyle(
            color: Colors.green,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
