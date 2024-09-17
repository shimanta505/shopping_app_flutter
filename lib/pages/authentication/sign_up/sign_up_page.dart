import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shopping_app/pages/navigation/bottom_navigation.dart';
import 'package:shopping_app/services/database.dart';
import 'package:shopping_app/utils/size_utils.dart';

import '../../../utils/image_path/image_path.dart';
import '../../../widget/support_widget.dart';
import '../sign_in/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? name, email, password;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  registration() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Registerd Successfully',
              style: TextStyle(
                fontSize: 20.fSize,
              ),
            )));
        print(userCredential);
        String id = randomAlphaNumeric(10);
        Map<String, dynamic> userInfoMap = {
          'Name': nameController.text,
          'Email': emailController.text,
          'Id': id,
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BottomNavigation()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'Password provided is too weak',
                style: TextStyle(
                  fontSize: 20.fSize,
                ),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'Account Already Exists',
                style: TextStyle(
                  fontSize: 20.fSize,
                ),
              )));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'missing property',
            style: TextStyle(
              fontSize: 20.fSize,
            ),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
                        'Sign Up',
                        style: AppWidget.semiBoldTextFieldStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20.v,
                    ),
                    Center(
                      child: Text(
                        'Please Enter the details below ',
                        style: AppWidget.lightTextFieldStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20.v,
                    ),
                    SizedBox(
                      height: 20.v,
                    ),
                    _nameSection(),
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
                      height: 10.v,
                    ),
                    _loginButton(),
                    SizedBox(
                      height: 20.v,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Allready have an account?',
                          style: AppWidget.lightTextFieldStyle
                              .copyWith(color: Colors.blue),
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage())),
                          child: Text('Sign in',
                              style: AppWidget.lightTextFieldStyle
                                  .copyWith(color: Colors.green)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.v,
                    ),
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
          registration();
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
              'Sign Up',
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
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your Email';
                }
                return null;
              },
            ),
          ),
        ],
      );

  Widget _nameSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: AppWidget.semiBoldTextFieldStyle,
          ),
          SizedBox(
            height: 20.v,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.h),
            decoration: const BoxDecoration(color: Color(0xFFF4F5F9)),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your name';
                }
                return null;
              },
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
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your passowrd';
                }
                return null;
              },
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
