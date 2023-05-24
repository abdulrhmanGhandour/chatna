import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:one_app/components/components.dart';
import 'package:one_app/constants/constants.dart';
import 'package:one_app/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:one_app/pages/cubits/chat_cubit/chat_cubit.dart';
import '../helper/Show_SnakBar.dart';
import 'SignUp_Page.dart';
import 'chat_page.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';
  String? password, email;
  bool isLoding = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoding) {
          isLoding = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoding = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoding = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoding,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        KNameApp,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: KAntonFont,
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormfild(
                        onChanged: (data) {
                          email = data;
                        },
                        labelText: 'Email',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextFormfild(
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                        labelText: 'Password',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextButtonContenar(
                        text: 'LOGIN',
                        color: Colors.white,
                        textColor: kPrimaryColor,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .loginUser(email: email, password: password);
                          } else {}
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'dont have an account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          CustomTextButton(
                            onTap: () {
                              Navigator.pushNamed(context, SinUpPage.id);
                            },
                            text: ' Sign up',
                            color: const Color.fromARGB(255, 151, 193, 214),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
