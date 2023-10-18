import 'package:fanatic/firebase_options.dart';
import 'package:fanatic/views/login_view.dart';
import 'package:fanatic/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
    routes: {
      "/login/": (context) => const LoginView(),
      "/register/": (context) => const RegisterView()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final user = FirebaseAuth.instance.currentUser;
            // if (user?.emailVerified ?? false) {
            //   return const Text("Email Is Verified...");
            // } else {
            //   return const VerifyEmailView();
            // }
            return const LoginView();
          default:
            return const CircularProgressIndicator();
        }
      },
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
    );
  }
}
