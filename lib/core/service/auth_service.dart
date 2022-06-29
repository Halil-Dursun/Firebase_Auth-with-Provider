

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/core/model/my_app_user.dart';
import 'package:firebase_demo/core/service/i_auth_service.dart';
import 'package:firebase_demo/core/service/mixin_user_convert.dart';

class AuthService with UserConvert implements IAuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyAppUser _getUser(User? user){
    return MyAppUser(userId: user!.uid, userEmail: user.email!);
  }

  @override
  Future<MyAppUser> createUserWithEmailAndPassword({required String email, required String password}) async{
    UserCredential _tempUser = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userConvert(_tempUser);
  }

  @override
  Stream<MyAppUser?> get onAuthStateChanged => _firebaseAuth.authStateChanges().map(_getUser);

  @override
  Future<MyAppUser> signInUserWithEmailAndPassword({required String email, required String password}) async{
    UserCredential _tempUser = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userConvert(_tempUser);
  }

  @override
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

}
