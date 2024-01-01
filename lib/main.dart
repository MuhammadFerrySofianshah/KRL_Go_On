import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krl_goon/providers/auth_provider.dart' as my_auth_provider;
import 'package:krl_goon/screens/customer/daftar_customer.dart';
import 'package:krl_goon/screens/customer/daftar_with_phone_number.dart';
import 'package:krl_goon/screens/home_screen.dart';
import 'package:krl_goon/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => my_auth_provider.AuthProvider()),
      ],
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: snapshot.connectionState == ConnectionState.active
                  ? (snapshot.hasData ? const HomeScreen() : const DaftarCustomer())
                  : const SplashScreen(),
            );
          }),
    );
  }
}

// class SplashScreenWrapper extends StatelessWidget {
//   const SplashScreenWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const SplashScreen();
//         } else {
//           return snapshot.hasData ? const HomeScreen() : const DaftarCustomer();
//         }
//       },
//     );
//   }
// }
