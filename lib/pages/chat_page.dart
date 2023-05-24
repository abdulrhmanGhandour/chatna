import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_app/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one_app/models/messages_models.dart';
import 'package:one_app/pages/cubits/chat_cubit/chat_cubit.dart';
import '../components/components.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});

  static String id = 'ChatPage';
  final ScrollController controllerScroll = ScrollController();
  final TextEditingController controller = TextEditingController();
   List<Message> messageList = [];

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Image.asset('assets/image/Screenshot_20230221_081907.png',
                height: 45),
           const SizedBox(
              width: 8,
            ),
            Text('fake user'),
          ],
        ),
        actions: const[
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.camera_alt_outlined),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.phone),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messageList = state.messageList;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: controllerScroll,
                  itemCount: messageList.length,
                  itemBuilder: ((context, index) {
                    return messageList[index].id == email
                        ? MessgeCustom(
                            message: messageList[index],
                          )
                        : MessgeCustomForFrend(message: messageList[index]);
                  }),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: value, email: email);
                controller.clear();
                controllerScroll.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon:const Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:const BorderSide(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
