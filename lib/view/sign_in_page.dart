import 'package:firebase_demo/core/service/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<IAuthService>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn Page'),
      ),  
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () async {
                 await _authService.createUserWithEmailAndPassword(email: 'deneme@gmail.com', password: '12345678');
              },
              color: Colors.blueAccent,
              child:  Text('Create User',style:  Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),),
            ),
            MaterialButton(
              onPressed: () async {
                 await _authService.signInUserWithEmailAndPassword(email: 'deneme@gmail.com', password: '12345678');
              },
              color: Colors.blueAccent,
              child:  Text('Login',style:  Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
