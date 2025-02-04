import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_goon/pages/home/home_page.dart';
import 'package:krl_goon/pages/home/rute/rute.dart';
import 'package:krl_goon/pages/phone-number/auth_phone_number.dart';
import 'package:krl_goon/pages/splash/splashScreen_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:krl_goon/test.dart';
import 'package:krl_goon/test.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return GetMaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          // home: snapshot.connectionState == ConnectionState.active
          //     ? (snapshot.hasData ? const HomePage() : const AuthPhoneNumber())
          //     : const SplashScreen(),
          // home: const SplashScreen(),
          home: const RutePage(),
        );
      },
    );
  }
}

