import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/routers/study_flow_routers.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/create_account/view/create_account_page.dart';
import 'package:study_flow/presentation/splash/splash_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Flow',
      home: const SplashPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: StudyFlowColors.primary,
        ),
        fontFamily: 'MPLUS1p',
        useMaterial3: true,
      ),
      routes: {
        StudyFlowRouters.splash: (context) => const SplashPage(),
        StudyFlowRouters.createAccount: (context) => const CreateAccountPage(),
      },
    );
  }
}
