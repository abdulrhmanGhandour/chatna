import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_app/constants/constants.dart';
import 'package:one_app/pages/Initial_page.dart';
import 'package:one_app/pages/Login_Page.dart';
import 'package:one_app/pages/SignUp_Page.dart';
import 'package:one_app/pages/chat_page.dart';
import 'package:one_app/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:one_app/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:one_app/simple_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: kPrimaryColor),
        debugShowCheckedModeBanner: false,
        routes: {
          ChatPage.id: (context) => ChatPage(),
          LoginPage.id: (context) => LoginPage(),
          SinUpPage.id: (context) => SinUpPage(),
          InitialPage.id :(context) => InitialPage(),
        },
        initialRoute:  InitialPage.id,
      ),
    );
  }
}
