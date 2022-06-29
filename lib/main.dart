import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/core/service/auth_service.dart';
import 'package:firebase_demo/core/service/i_auth_service.dart';
import 'package:firebase_demo/core/widgets/auth_widget.dart';
import 'package:firebase_demo/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/widgets/auth_widget_builder.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthService>(create: (_) => AuthService()),
      ],
      child: AuthWidgetBuilder(
        onPageBuilder:  (context, snapShot) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Authwidget(snapshot: snapShot),
        );
        },
         
      ),
    );
  }
}

