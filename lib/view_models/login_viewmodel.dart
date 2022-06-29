
import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_glade/base/base_view_model/base_vm.dart';
import 'package:mini_glade/components/general_widget/general_widget.dart';

class LoginViewModel extends BaseViewModel{
  LoginViewModel(BuildContext context);

  @override
  FutureOr<void> disposeState() {
    // TODO: implement disposeState
  }

  @override
  FutureOr<void> initState() {
    // TODO: implement initState
  }


  String? _uid;
  String? _email;

  String? get getUid => _uid;

  String? get getEmail => _email;

  // final userRef = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> get getCurrentUser async {
    user = _auth.currentUser;
  }

  Future<void> signOut() async {
    _auth.signOut();
  }


  Future loginUser(String email, String password, BuildContext context) async {
changeLoaderStatus(true);
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email;
        return true;
      }
    } on FirebaseAuthException catch (error) {
      showSnackBar(error.message!.toString(),  context);
      log('${error.message!.toString()}');
      changeLoaderStatus(false);
    }
  }

  // Future getUserDetails(UsersModel usersModel) async {
  //   final firebaseUser = FirebaseAuth.instance.currentUser;
  //   await userRef.doc(firebaseUser!.uid).get().then((value) {
  //     // print(value.data()!['name']);
  //     usersModel.firstName = value.data()!['firstName'];
  //     usersModel.lastName = value.data()!['lastName'];
  //     usersModel.email = value.data()!['email'];
  //     usersModel.phone = value.data()!['phone'];
  //     usersModel.profilePhoto = value.data()!['Profile photo'];
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  //   notifyListeners();
  // }

}