import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/authentication/sign_up/sign_up_page.dart';
import 'package:shopping_app/utils/image_path/image_path.dart';
import 'package:shopping_app/utils/size_utils.dart';
import 'package:shopping_app/widget/support_widget.dart';

import '../../navigation/bottom_navigation.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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

  userLogin() async {
    if (!_formKey.currentState!.validate()) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'missing property',
            style: TextStyle(
              fontSize: 20.fSize,
            ),
          )));
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Sign in Successfully',
            style: TextStyle(
              fontSize: 20.fSize,
            ),
          )));
      print(userCredential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const BottomNavigation()));
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'No User Found For That Email',
              style: TextStyle(
                fontSize: 20.fSize,
              ),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Wrong Password Provided By User',
              style: TextStyle(
                fontSize: 20.fSize,
              ),
            )));
      }
    }
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
                        'Sign In',
                        style: AppWidget.semiBoldTextFieldStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20.v,
                    ),
                    Text(
                      'Please Enter the details below ',
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
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage())),
                          child: Text('Sign Up',
                              style: AppWidget.lightTextFieldStyle
                                  .copyWith(color: Colors.green)),
                        )
                      ],
                    )
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
        onTap: () => userLogin(),
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

  Widget _emailSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
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
