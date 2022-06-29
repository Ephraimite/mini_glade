import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_glade/base/base_view_model/base_vm.dart';
import 'package:mini_glade/components/general_widget/general_widget.dart';

class SignupViewModel extends BaseViewModel {
  String? _uid;
  String? _email;

  SignupViewModel(BuildContext context);

  String? get getUid => _uid;

  String? get getEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  FutureOr<void> disposeState() {
    // TODO: implement disposeState
    throw UnimplementedError();
  }

  @override
  FutureOr<void> initState() {
    // TODO: implement initState
    throw UnimplementedError();
  }

  Future signUpUser(String email, String password, BuildContext context) async {
    bool value = false;
    changeLoaderStatus(true);
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email;
        changeLoaderStatus(false);
        // saveUserDetails(firstNameController.text, lastNameController.text,
        //     phoneEditingController.text, passwordEditingController.text, _uid!,
        //     _email!);
      }
    } on FirebaseException catch (error) {
      showSnackBar(error.toString(), context);
      log(error.toString());
    }
  }


}
