 import 'package:blind_side/services/util_service.dart';
import 'package:blind_side/utils/routes.dart';
import 'package:blind_side/utils/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../services/navigation_service.dart';
import '../services/storage_service.dart';

class AuthProvider extends ChangeNotifier{

  final passController = TextEditingController();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailCntLgn = TextEditingController();
  final pssCntLgn = TextEditingController();
  bool isLoadingSignUp=false;
  bool isLoadingLogin=false;

  userModel? userData;

  setUData(userModel value){
    userData=value;
    notifyListeners();
  }

  setLoadingS(bool value){
    isLoadingSignUp=value;
    notifyListeners();
  }
  setLoadingL(bool value){
    isLoadingLogin=value;
    notifyListeners();
  }



  final utilService=locator<UtilService>();
  final navigationService = locator<NavigationService>();
  final storageService = locator<StorageService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;




 final FirebaseFirestore _firebase= FirebaseFirestore.instance;
 setUserData(String email,String name)async{
   await storageService.setData('email', "$email");
   await storageService.setData('name', "$name");

 }


  Future<void> handleSignInEmail() async {


    try{
      setLoadingL(true);
      UserCredential result = await _auth.signInWithEmailAndPassword(email: emailCntLgn.text, password: pssCntLgn.text);
      final User user = result.user!;


      CollectionReference ref = _firebase.collection('userData');

      QuerySnapshot eventsQuery = await ref
          .where("email", isEqualTo: "${user.email}").get();

      eventsQuery.docs.forEach((element) {
        setUserData(element["email"],element["fullName"]);
       // print(element["email"]);
      });


      setLoadingL(false);
      navigationService.navigateTo(HomeScreenRoute);


    }on FirebaseAuthException catch (err) {
      setLoadingL(false);
        utilService.showToast(err.toString());

    }

    //return user;
  }

  Future<void> handleSignUp() async {



    try{

      if(fullNameController.text.isEmpty || emailController.text.isEmpty || passController.text.isEmpty){
        utilService.showToast("Please Enter all Fields");
        return;
      }
      else{
        setLoadingS(true);
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passController.text);
        final User user = result.user!;
        setUserData('${user.email}','${fullNameController.text}');



        _firebase.collection('userData')
            .add({
          'email': '${user.email}',
          'fullName': '${fullNameController.text}',
        });
      }



      navigationService.navigateTo(HomeScreenRoute);
      setLoadingS(false);


    } on FirebaseAuthException catch (err) {
      setLoadingS(false);
      if (err.code == 'user-not-found') {
        utilService.showToast('Invalid email.');
      } else if (err.code == 'network-request-failed') {
        utilService.showToast("network error");
      } else if (err.code == 'too-many-requests') {
        utilService.showToast(
            "We have blocked all requests from this device due to unusual activity. Try again later.");
      } else if (err.code == 'email-already-in-use') {
        utilService.showToast(
            "The email address is already in use by another account.");
      } else if (err.code == 'invalid-email') {
        utilService.showToast('Invalid email.');
      } else if (err.code == 'wrong-password') {
        utilService.showToast('Invalid password.');
      }  else {
        utilService.showToast(err.toString());
      }
    }
    notifyListeners();

  }
}


class userModel{
  String? email;
  String? name;

  userModel({this.email,this.name});
 }