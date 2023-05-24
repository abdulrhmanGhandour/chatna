import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_app/pages/cubits/auth_cubit/auth_cubit.dart';
import '../components/components.dart';
import '../constants/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/Show_SnakBar.dart';
import 'chat_page.dart';

class SinUpPage extends StatelessWidget {
  static String id = 'SinUpPage';
  String? email;
  String? password;
  bool isLoding = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoding) {
          isLoding = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoding = false;
        } else if (state is RegisterFailuer) {
          showSnackBar(context, state.errMesage);
          isLoding = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoding,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(children: [
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
                            'Sing Up',
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
                        text: 'Sign Up',
                        color: Colors.white,
                        textColor: kPrimaryColor,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .registerUser(email: email, password: password);
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
                            'already have an account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              ' log in',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey[200],
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
