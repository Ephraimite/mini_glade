import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/base/base_view.dart';
import 'package:mini_glade/components/appbar_without_arrow.dart';
import 'package:mini_glade/components/general_widget/general_widget.dart';
import 'package:mini_glade/components/navigator.dart';
import 'package:mini_glade/components/reuseable_filled_button.dart';
import 'package:mini_glade/components/reuseable_text_field.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:mini_glade/screens/bottom_navigation_screen.dart';
import 'package:mini_glade/screens/home_screen.dart';
import 'package:mini_glade/screens/signup_screen.dart';
import 'package:mini_glade/view_models/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      vmBuilder: (context) => LoginViewModel(context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      appBar: AppBarWithoutArrow(title: const Text('')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,\nWelcome back.',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ReuseableTextField(
                      label: 'Email Address',
                      hintText: 'Enter your email address',
                      textEditingController: viewModel.emailController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReuseableTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      textEditingController: viewModel.passwordController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: colorPrimary),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ReuseableFilledButton(
                        text: 'Login',
                        textColor: Colors.white,
                        onPressed: () async {
                          if (viewModel.emailController.text.isEmpty &&
                              viewModel.passwordController.text.isEmpty) {
                            showSnackBar('Fields cannot be empty', context);
                          } else if (viewModel.emailController.text.isEmpty) {
                            showSnackBar('Email cannot be empty', context);
                          } else if (viewModel
                              .passwordController.text.isEmpty) {
                            showSnackBar('Password cannot be empty', context);
                          } else {
                            viewModel.changeLoaderStatus(true);
                            if (await viewModel.loginUser(
                                viewModel.emailController.text,
                                viewModel.passwordController.text,
                                context)) {
                              navigateToRoute(context, BottomNavigation());
                              viewModel.changeLoaderStatus(false);
                            } else {
                              showSnackBar('Something went wrong', context);
                              viewModel.changeLoaderStatus(false);
                            }
                          }
                        }),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Center(
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'New here?',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen())),
                              child: Text(
                                'create account?',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                    color: colorPrimary),
                              ),
                            ),
                          ]),
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
}
