import 'package:firebase_demo/core/service/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<IAuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(onPressed: () async{
            await _authService.signOut();
          }, icon: const Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}
