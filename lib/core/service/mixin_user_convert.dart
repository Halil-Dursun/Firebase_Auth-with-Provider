
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/core/model/my_app_user.dart';

mixin UserConvert{
  MyAppUser userConvert(UserCredential userCredential){
    return MyAppUser(userId: userCredential.user!.uid, userEmail: userCredential.user!.email!);
  }
}