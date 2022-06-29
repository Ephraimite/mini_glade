import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/base/base_view.dart';
import 'package:mini_glade/components/navigator.dart';
import 'package:mini_glade/components/resuseable_app_bar.dart';
import 'package:mini_glade/components/reuseable_filled_button.dart';
import 'package:mini_glade/components/reuseable_text_field.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:mini_glade/screens/login_screen.dart';
import 'package:mini_glade/view_models/sign_up_viewmodel.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupViewModel>(
      vmBuilder: (context) => SignupViewModel(context),
      builder: _buildScreen,
    );
  }
  Widget _buildScreen(BuildContext context, SignupViewModel viewModel) {
    return Scaffold(
      appBar: ReuseableAppBar(title: Text('Sign up'),),
      backgroundColor: Colors.grey[100],
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.h),
                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'create a new account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                        child: ReuseableTextField(
                          hintText: 'Enter your first name',
                          label: 'First Name',
                          textEditingController: viewModel.passwordEditingController,
                        )),
                    SizedBox(width: 10),
                    Expanded(
                        child: ReuseableTextField(
                          label: 'Last Name',
                          hintText: 'Enter your last name',
                          textEditingController: viewModel.passwordEditingController,
                        )),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ReuseableTextField(
                      label: 'Email Address',
                      hintText: 'Enter your email address',
                      textEditingController: viewModel.passwordEditingController,
                    )),
                SizedBox(height: 20.h),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ReuseableTextField(
                      label: 'Phone Number',
                      hintText: 'Enter your phone number',
                      textEditingController: viewModel.passwordEditingController,
                    )),
                SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ReuseableTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      textEditingController: viewModel.passwordEditingController,
                    )),
                SizedBox(height: 20),
                Builder(
                  builder: (context) => ReuseableFilledButton(
                      text: 'Register',
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // return signUpUser(
                          //   firstNameController.text,
                          //   lastNameController.text,
                          //   emailEditingController.text,
                          //   phoneEditingController.text,
                          //   passwordEditingController.text,
                          //   context,
                          // );
                        }
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: ()=> navigateToRoute(context, LoginScreen()),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: colorPrimary,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
