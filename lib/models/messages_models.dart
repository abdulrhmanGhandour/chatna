import 'package:one_app/constants/constants.dart';

class Message {
  final String messge;
  final String id;

  Message(this.messge, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[KMessageModel], jsonData['id']);
  }
}
