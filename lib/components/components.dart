import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:one_app/constants/constants.dart';

import '../models/messages_models.dart';

// CustomTextfild
class CustomTextFormfild extends StatelessWidget {
  const CustomTextFormfild(
      {this.labelText, this.onChanged, this.obscureText = false});

  final Function(String)? onChanged;
  final String? labelText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
      },
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.white),
        labelText: labelText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//CustomTextButton contenar
class CustomTextButtonContenar extends StatelessWidget {
 const  CustomTextButtonContenar(
      {required this.text,
      required this.onTap,
      required this.color,
      this.textColor = Colors.white ,
      this.width = double.infinity,
      this.height  = 60.0});

 final VoidCallback? onTap;
 final String text;
 final Color color;
 final Color? textColor ;
 final double? width ;
 final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

//MessgeCustom bpuble
class MessgeCustom extends StatelessWidget {
 const MessgeCustom({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding:const  EdgeInsets.only(left: 16, right: 28, top: 32, bottom: 32),
        decoration:const  BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            bottomLeft: Radius.circular(0),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.messge,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//MessgeCustom bpuble - 2
class MessgeCustomForFrend extends StatelessWidget {
  MessgeCustomForFrend({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.only(left: 16, right: 28, top: 32, bottom: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.teal,
        ),
        child: Text(
          message.messge,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//Custom text Button
class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      this.fontFamily
      });

  VoidCallback onTap;
  String text;
  Color color;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
