import 'package:firebase_demo/core/model/my_app_user.dart';
import 'package:firebase_demo/core/widgets/error_page.dart';
import 'package:firebase_demo/view/home_page.dart';
import 'package:firebase_demo/view/sign_in_page.dart';
import 'package:flutter/material.dart';

class Authwidget extends StatelessWidget {
  const Authwidget({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<MyAppUser?> snapshot;
 
  @override
  Widget build(BuildContext context) {
    if(snapshot.connectionState == ConnectionState.active){
      return snapshot.hasData ? const HomePage() : const SignInPage();
    }
    return const ErrorPage();
  }
}