
import 'package:firebase_demo/core/model/my_app_user.dart';

abstract class IAuthService{
  Future<MyAppUser> createUserWithEmailAndPassword({required String email,required String password});
  Future<MyAppUser> signInUserWithEmailAndPassword({required String email,required String password});
  Future<void> signOut();
  Stream<MyAppUser?> get onAuthStateChanged;
}